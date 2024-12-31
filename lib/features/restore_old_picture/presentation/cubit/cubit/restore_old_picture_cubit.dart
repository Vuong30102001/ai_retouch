import 'package:ai_retouch/features/restore_old_picture/presentation/screen/restore_old_picture_screen.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/screen/restored_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../domain/repositories/restore_old_picture_repository.dart';
import '../../screen/restore_watch_ads_screen.dart';
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

  void openRestoreWatchAdsScreen(BuildContext context, AssetEntity media) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestoreWatchAdsScreen(media: media),
      ),
    );
  }

  void openRestoreOldPictureScreen(BuildContext context, AssetEntity media){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RestoreOldPictureScreen(media: media),
      ),
    );
  }

  Future<void> restoreImage(AssetEntity media) async {
    emit(state.copyWith(isLoading: true));

    try {
      final file = await media.file;
      if (file == null) {
        throw Exception('Image file not found');
      }

      final token = await repository.getToken();
      if (token == null) {
        throw Exception('Unable to retrieve token');
      }

      await repository.restoreImage(file.path, token);

      emit(state.copyWith(successMessage: 'Image has been successfully restored!'));

    } catch (error, stacktrace) {
      print('Error: $error');
      print('Stacktrace: $stacktrace');
      emit(state.copyWith(errorMessage: 'An error occurred: $error'));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void openRestoredImageScreen(BuildContext context, AssetEntity media) async {
    final file = await media.file;
    if(file != null){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RestoredImageScreen(imagePath: file.path,),
        ),
      );
    }
  }

}