import 'package:ai_retouch/features/cartoon_ai/domain/use_case/cartoon_ai_use_case.dart';
import 'package:ai_retouch/features/cartoon_ai/presentation/cubit/state/cartoon_ai_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class CartoonAiCubit extends Cubit<CartoonAiState>{
  final CartoonAiUseCase cartoonAiUseCase;
  CartoonAiCubit({required this.cartoonAiUseCase}) : super(CartoonAiState.initial());

  Future<void> fetchAlbums() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if(!permission.isAuth){
      PhotoManager.openSetting();
      return;
    }
    emit(state.copyWith(isLoadingAlbums: true, errorMessage: null));
    try{
      final albums = await cartoonAiUseCase.getAlbums();
      emit(state.copyWith(isLoadingAlbums: false, albums: albums));
    }
    catch (e){
      emit(state.copyWith(
        isLoadingAlbums: false,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> fetchMedias(AssetPathEntity selectedAlbum) async {
    emit(state.copyWith(isLoadingMedias: true));
    final newMedias = await selectedAlbum.getAssetListPaged(page: state.currentPage, size: state.pageSize);

    emit(state.copyWith(
      isLoadingMedias: false,
      media: newMedias,
      currentPage: state.currentPage + 1,
    ));
  }

  Future<void> loadMoreMedia(AssetPathEntity selectedAlbum) async {
    emit(state.copyWith(isLoadingMoreMedia: true));

    final newMedias = await selectedAlbum.getAssetListPaged(page: state.currentPage, size: state.pageSize);

    emit(state.copyWith(
      isLoadingMoreMedia: false,
      media: List.from(state.media)..addAll(newMedias),
      currentPage: state.currentPage + 1,
    ));
  }

  void selectAlbum(AssetPathEntity selectedAlbum){
    emit(state.copyWith(
      albums: state.albums,
      media: [],
      currentPage: 0,
      selectedAlbum: selectedAlbum,
    ));
    fetchMedias(selectedAlbum);
  }

  Future<void> fetchStyles() async {
    emit(state.copyWith(isLoadingStyles: true));
    try{
      final styles = await cartoonAiUseCase.getStyles();
      emit(state.copyWith(isLoadingStyles: false, styles: styles));
    }
    catch(e){
      emit(state.copyWith(isLoadingStyles: false, errorMessage: e.toString()));
    }
  }
}