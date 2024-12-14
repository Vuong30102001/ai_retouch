import 'package:ai_retouch/features/enhance_photo/presentation/cubit%20/state/enhance_photo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class EnhancePhotoCubit extends Cubit<EnhancePhotoState> {
  EnhancePhotoCubit() : super(EnhancePhotoState.initial());

  Future<void> fetchAlbums() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) {
      PhotoManager.openSetting();
      return;
    }

    final albumList = await PhotoManager.getAssetPathList(
      type: RequestType.common,
    );

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
      mediaList: newMedia,
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
      mediaList: List.from(state.mediaList)..addAll(newMedia),
      currentPage: state.currentPage + 1,
      isLoading: false,
    ));
  }

  void selectAlbum(AssetPathEntity album) {
    emit(state.copyWith(
      albums: state.albums,
      selectedAlbum: album,
      mediaList: [],
      currentPage: 0,
    ));
    _fetchMedia(album);
  }
}