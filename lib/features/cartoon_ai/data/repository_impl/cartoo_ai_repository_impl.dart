import 'package:ai_retouch/features/cartoon_ai/data/data_source/cartoon_ai_data_source.dart';
import 'package:ai_retouch/features/cartoon_ai/domain/entity/cartoon_ai_entity.dart';
import 'package:ai_retouch/features/cartoon_ai/domain/repository/cartoon_ai_repository.dart';
import 'package:photo_manager/photo_manager.dart';

class CartoonAiRepositoryImpl implements CartoonAiRepository{
  final CartoonAiDataSource cartoonAiDataSource;

  CartoonAiRepositoryImpl(this.cartoonAiDataSource);

  @override
  Future<List<AssetPathEntity>> fetchAlbums() async {
    return cartoonAiDataSource.getAlbums();
  }

  @override
  Future<List<CartoonAiEntity>> fetchMedias(int page, int size) async {
    final medias = await cartoonAiDataSource.getMedias(page, size);
    return medias.map((media){
      return media.toEntity();
    }).toList();
  }
}