import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../domain/repositories/restore_old_picture_repository.dart';
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

}