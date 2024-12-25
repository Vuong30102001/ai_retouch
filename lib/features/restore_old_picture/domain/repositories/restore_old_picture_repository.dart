import 'package:ai_retouch/features/restore_old_picture/domain/entities/restore_old_picture_entity.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class RestoreOldPictureRepository{
  Future<List<AssetPathEntity>> fetchAlbums();
  Future<List<RestoreOldPictureEntity>> fetchMedias(int page, int size);
}