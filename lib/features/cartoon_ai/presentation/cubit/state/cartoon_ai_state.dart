import 'package:equatable/equatable.dart';
import 'package:photo_manager/photo_manager.dart';

class CartoonAiState extends Equatable{
  final bool isLoadingAlbums;
  final List<AssetPathEntity> albums;
  final AssetPathEntity? selectedAlbum;
  final List<AssetEntity> media;
  final bool isLoadingMoreMedia;
  final bool hasMoreMedia;

  const CartoonAiState({
    required this.isLoadingAlbums,
    required this.albums,
    required this.selectedAlbum,
    required this.media,
    required this.isLoadingMoreMedia,
    required this.hasMoreMedia,
  });

  factory CartoonAiState.initial(){
    return CartoonAiState(
        isLoadingAlbums: true,
        albums: [],
        selectedAlbum: null,
        media: [],
        isLoadingMoreMedia: false,
        hasMoreMedia: true,
    );
  }

  CartoonAiState copyWith({
    bool? isLoadingAlbums,
    List<AssetPathEntity>? albums,
    AssetPathEntity? selectedAlbum,
    List<AssetEntity>? media,
    bool? isLoadingMoreMedia,
    bool? hasMoreMedia,
  }) {
    return CartoonAiState(
        isLoadingAlbums: isLoadingAlbums ?? this.isLoadingAlbums,
        albums: albums ?? this.albums,
        selectedAlbum: selectedAlbum ?? this.selectedAlbum,
        media: media ?? this.media,
        isLoadingMoreMedia: isLoadingMoreMedia ?? this.isLoadingMoreMedia,
        hasMoreMedia: hasMoreMedia ?? this.hasMoreMedia,
    );
  }

  @override
  List<Object?> get props => [
    isLoadingAlbums,
    albums,
    selectedAlbum,
    media,
    isLoadingMoreMedia,
    hasMoreMedia,
  ];
}