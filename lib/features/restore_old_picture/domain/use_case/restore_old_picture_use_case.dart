import 'package:ai_retouch/features/restore_old_picture/domain/entities/restore_old_picture_entity.dart';
import 'package:ai_retouch/features/restore_old_picture/domain/repositories/restore_old_picture_repository.dart';
import 'package:photo_manager/photo_manager.dart';

class RestoreOldPictureUseCase{
  final RestoreOldPictureRepository restoreOldPictureRepository;
  RestoreOldPictureUseCase(this.restoreOldPictureRepository);

  Future<List<AssetPathEntity>> getAlbums() async {
    return restoreOldPictureRepository.fetchAlbums();
  }

  Future<List<RestoreOldPictureEntity>> getMedia(int page, int size) async {
    return restoreOldPictureRepository.fetchMedias(page, size);
  }
}