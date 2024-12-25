import 'package:ai_retouch/features/restore_old_picture/domain/entities/restore_old_picture_entity.dart';
import 'package:photo_manager/photo_manager.dart';

class RestoreOldPictureState{
  final List<AssetPathEntity> albums;
  final List<AssetEntity> medias;
  final AssetPathEntity? selectedAlbum;
  final bool isLoading;
  final int currentPage;
  final int pageSize;
  RestoreOldPictureState({
    required this.albums,
    required  this.medias,
    this.selectedAlbum,
    required this.isLoading,
    required this.currentPage,
    required this.pageSize,
  });

  factory RestoreOldPictureState.initial(){
    return RestoreOldPictureState(
        albums: [],
        medias: [],
        selectedAlbum: null,
        isLoading: false,
        currentPage: 0,
        pageSize: 20,
    );
  }

  RestoreOldPictureState copyWith({
    List<AssetPathEntity>? albums,
    List<AssetEntity>? medias,
    AssetPathEntity? selectedAlbum,
    bool? isLoading,
    int? currentPage,
    int? pageSize,
  }){
    return RestoreOldPictureState(
      albums: albums ?? this.albums,
      medias: medias ?? this.medias,
      selectedAlbum: selectedAlbum ??this.selectedAlbum,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}