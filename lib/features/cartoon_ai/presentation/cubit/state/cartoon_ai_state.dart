import 'package:ai_retouch/features/cartoon_ai/domain/entity/cartoon_style.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_manager/photo_manager.dart';

class CartoonAiState extends Equatable{
  final bool isLoadingAlbums;
  final bool isLoadingMedias;
  final List<AssetPathEntity> albums;
  final AssetPathEntity? selectedAlbum;
  final List<AssetEntity> media;
  final bool isLoadingMoreMedia;
  final bool hasMoreMedia;
  final String? errorMessage;
  final int currentPage;
  final int pageSize;
  final List<CartoonStyle> styles;
  final bool isLoadingStyles;

  const CartoonAiState({
    required this.isLoadingAlbums,
    required this.isLoadingMedias,
    required this.albums,
    required this.selectedAlbum,
    required this.media,
    required this.isLoadingMoreMedia,
    required this.hasMoreMedia,
    this.errorMessage,
    required this.currentPage,
    required this.pageSize,
    required this.styles,
    required this.isLoadingStyles,
  });

  factory CartoonAiState.initial(){
    return const CartoonAiState(
        isLoadingAlbums: true,
        isLoadingMedias: true,
        albums: [],
        selectedAlbum: null,
        media: [],
        isLoadingMoreMedia: false,
        hasMoreMedia: true,
        errorMessage: null,
        currentPage: 0,
        pageSize: 20,
        styles: [],
      isLoadingStyles: true,
    );
  }

  CartoonAiState copyWith({
    bool? isLoadingAlbums,
    bool? isLoadingMedias,
    List<AssetPathEntity>? albums,
    AssetPathEntity? selectedAlbum,
    List<AssetEntity>? media,
    bool? isLoadingMoreMedia,
    bool? hasMoreMedia,
    String? errorMessage,
    int? currentPage,
    int? pageSize,
    List<CartoonStyle>? styles,
    bool? isLoadingStyles,
  }) {
    return CartoonAiState(
        isLoadingAlbums: isLoadingAlbums ?? this.isLoadingAlbums,
        isLoadingMedias: isLoadingMedias ?? this.isLoadingMedias,
        albums: albums ?? this.albums,
        selectedAlbum: selectedAlbum ?? this.selectedAlbum,
        media: media ?? this.media,
        isLoadingMoreMedia: isLoadingMoreMedia ?? this.isLoadingMoreMedia,
        hasMoreMedia: hasMoreMedia ?? this.hasMoreMedia,
        errorMessage: errorMessage,
        currentPage: currentPage ?? this.currentPage,
        pageSize: pageSize ?? this.pageSize,
        styles: styles ?? this.styles,
        isLoadingStyles: isLoadingStyles ?? this.isLoadingStyles,
    );
  }

  @override
  List<Object?> get props => [
    isLoadingAlbums,
    isLoadingMedias,
    albums,
    selectedAlbum,
    media,
    isLoadingMoreMedia,
    hasMoreMedia,
    errorMessage,
    currentPage,
    pageSize,
    styles,
    isLoadingStyles,
  ];
}