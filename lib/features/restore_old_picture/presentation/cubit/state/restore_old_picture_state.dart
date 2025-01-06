import 'package:photo_manager/photo_manager.dart';

class RestoreOldPictureState{
  final List<AssetPathEntity> albums;
  final List<AssetEntity> medias;
  final AssetPathEntity? selectedAlbum;
  final bool isLoading;
  final int currentPage;
  final int pageSize;
  //
  final String? successMessage;
  final String? errorMessage;
  RestoreOldPictureState({
    required this.albums,
    required  this.medias,
    this.selectedAlbum,
    required this.isLoading,
    required this.currentPage,
    required this.pageSize,
    this.successMessage,
    this.errorMessage,
  });

  factory RestoreOldPictureState.initial(){
    return RestoreOldPictureState(
        albums: [],
        medias: [],
        selectedAlbum: null,
        isLoading: false,
        currentPage: 0,
        pageSize: 20,
        successMessage: null,
        errorMessage: null,
    );
  }

  RestoreOldPictureState copyWith({
    List<AssetPathEntity>? albums,
    List<AssetEntity>? medias,
    AssetPathEntity? selectedAlbum,
    bool? isLoading,
    int? currentPage,
    int? pageSize,
    String? successMessage,
    String? errorMessage,
  }){
    return RestoreOldPictureState(
      albums: albums ?? this.albums,
      medias: medias ?? this.medias,
      selectedAlbum: selectedAlbum ??this.selectedAlbum,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }
}