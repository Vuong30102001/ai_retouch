import 'package:ai_retouch/features/cartoon_ai/domain/entity/cartoon_ai_entity.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class CartoonAiRepository{
  Future<List<AssetPathEntity>>fetchAlbums();
  Future<List<CartoonAiEntity>> fetchMedias(int page, int size);
}