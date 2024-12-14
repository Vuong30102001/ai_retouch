import 'package:photo_manager/photo_manager.dart';

class RemoveObjectState{
  final List<AssetPathEntity> albums;
  final List<AssetEntity> mediaList;
  final AssetPathEntity? selectedAlbum;
  final bool isLoading;
  final int currentPage;
  final int pageSize;

  RemoveObjectState({
    required this.albums,
    required this.mediaList,
    this.selectedAlbum,
    required this.isLoading,
    required this.currentPage,
    required this.pageSize
  });

  factory RemoveObjectState.initial(){
    return RemoveObjectState(
      albums: [],
      mediaList: [],
      selectedAlbum: null,
      isLoading: false,
      currentPage: 0,
      pageSize: 20,
    );
  }

  RemoveObjectState copyWith({
    List<AssetPathEntity>? albums,
    List<AssetEntity>? mediaList,
    AssetPathEntity? selectedAlbum,
    bool? isLoading,
    int? currentPage,
    int? pageSize,
  }) {
    return RemoveObjectState(
      albums: albums ?? this.albums,
      mediaList: mediaList ?? this.mediaList,
      selectedAlbum: selectedAlbum ?? this.selectedAlbum,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      pageSize: pageSize ?? this.pageSize,
    );
  }
}