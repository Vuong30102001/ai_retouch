import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ai_retouch/features/restore_old_picture/presentation/screen/restore_old_picture_screen.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/screen/restored_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../domain/repositories/restore_old_picture_repository.dart';
import '../../screen/restore_media_check_screen.dart';
import '../state/restore_old_picture_state.dart';

class RestoreOldPictureCubit extends Cubit<RestoreOldPictureState> {
  final RestoreOldPictureRepository repository;
  RestoreOldPictureCubit({required this.repository}) : super(RestoreOldPictureState.initial());

  Future<void> fetchAlbums() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      PhotoManager.openSetting();
      return;
    }

    final albumList = await repository.fetchAlbums();

    emit(state.copyWith(albums: albumList));

    if (albumList.isNotEmpty) {
      _fetchMedia(albumList[0]);
    }
  }

  Future<void> _fetchMedia(AssetPathEntity selectedAlbum) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final newMedia = await selectedAlbum.getAssetListPaged(
      page: state.currentPage,
      size: state.pageSize,
    );

    emit(state.copyWith(
      medias: newMedia,
      currentPage: state.currentPage + 1,
      isLoading: false,
    ));
  }

  Future<void> loadMoreMedia(AssetPathEntity selectedAlbum) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final newMedia = await selectedAlbum.getAssetListPaged(
      page: state.currentPage,
      size: state.pageSize,
    );

    emit(state.copyWith(
      medias: List.from(state.medias)..addAll(newMedia),
      currentPage: state.currentPage + 1,
      isLoading: false,
    ));
  }

  void selectAlbum(AssetPathEntity album) {
    emit(state.copyWith(
      albums: state.albums,
      selectedAlbum: album,
      medias: [],
      currentPage: 0,
    ));
    _fetchMedia(album);
  }

  void openRestoreCheckScreen(BuildContext context, AssetEntity media) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestoreMediaCheckScreen(media: media),
      ),
    );
  }

  void openRestoreOldPictureScreen(BuildContext context, AssetEntity media){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestoreOldPictureScreen(
          media: media,
        ),
      ),
    );
  }


  Future<String> restoreImage(File fileImage) async {
    emit(state.copyWith(isLoading: true));

    try {
      final token = await repository.getToken();
      if (token == null) {
        throw Exception('Unable to retrieve token');
      }

      final restoredImagePath = await repository.restoreImage(fileImage.path, token);

      emit(state.copyWith(successMessage: 'Image has been successfully restored!'));

      return restoredImagePath;

    } catch (error, stacktrace) {
      print('Error: $error');
      print('Stacktrace: $stacktrace');
      emit(state.copyWith(errorMessage: 'An error occurred: $error'));
      rethrow; // Để xử lý lỗi ở nơi gọi hàm
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }



  void openRestoredImageScreen(BuildContext context, String restoredImagePath, File originalImage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestoredImageScreen(base64Image: restoredImagePath, originalImage: originalImage),
      ),
    );
  }


  Future<File> convertBase64StrToFile(String base64Str) async {
    emit(state.copyWith(isLoading: true));
    try {
      final bytes = base64Decode(base64Str);
      final dir = await getTemporaryDirectory();

      final fileName = 'restored_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final file = File('${dir.path}/$fileName');

      await file.writeAsBytes(bytes);
      await Future.delayed(const Duration(seconds: 2));
      return file;
    } catch (error, stacktrace) {
      print('Error: $error');
      print('Stacktrace: $stacktrace');
      emit(state.copyWith(errorMessage: 'An error occurred: $error'));
      rethrow;
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }


  Future<File> convertAssetPathToFile(String assetPath) async {
    final Uint8List? imageData = await convertAssetPathToUint8List(assetPath);
    final tempDir = await getTemporaryDirectory();
    final fileName = 'restored_image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final file = File('${tempDir.path}/$fileName');
    await file.writeAsBytes(imageData!);
    return file;
  }

  Future<Uint8List?> convertAssetPathToUint8List(String assetPath) async {
    emit(state.copyWith(isLoading: true));
    try {
      final ByteData data = await rootBundle.load(assetPath);
      return data.buffer.asUint8List();
    } catch (e) {
      print('Error loading image: $e');
      return null;
    }
    finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}