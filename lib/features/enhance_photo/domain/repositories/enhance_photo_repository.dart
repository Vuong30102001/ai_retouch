import 'package:ai_retouch/features/enhance_photo/domain/entities/enhance_photo_entity.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class EnhancePhotoRepository{
  Future<List<AssetPathEntity>> fetchAlbums();
  Future<List<EnhancePhotoEntity>> fetchMedia(int page, int size);
}