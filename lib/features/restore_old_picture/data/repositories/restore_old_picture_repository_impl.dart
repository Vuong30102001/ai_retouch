import 'package:ai_retouch/features/restore_old_picture/data/data_source/restore_old_picture_data_source.dart';
import 'package:ai_retouch/features/restore_old_picture/domain/entities/restore_old_picture_entity.dart';
import 'package:ai_retouch/features/restore_old_picture/domain/repositories/restore_old_picture_repository.dart';
import 'package:photo_manager/photo_manager.dart';

class RestoreOldPictureRepositoryImpl implements RestoreOldPictureRepository{
  final RestoreOldPictureDataSource restoreOldPictureDataSource;

  RestoreOldPictureRepositoryImpl(this.restoreOldPictureDataSource);

  @override
  Future<List<AssetPathEntity>> fetchAlbums() async {
    return restoreOldPictureDataSource.getAlbums();
  }

  @override
  Future<List<RestoreOldPictureEntity>> fetchMedias(int page, int size) async {
    final medias = await restoreOldPictureDataSource.getMedias(page, size);
    return medias.map((media){
      return media.toEntity();
    }).toList();
  }

  @override
  Future<String?> getToken() async {
    try {
      return await restoreOldPictureDataSource.getToken();
    } catch (e) {
      throw Exception('Error fetching token: $e');
    }
  }

  @override
  Future<String> restoreImage(String filePath, String token) async {
    try {
      final restoredImagePath = await restoreOldPictureDataSource.restoreImage(filePath, token);

      return restoredImagePath;
    } catch (e) {
      throw Exception('Error restoring image: $e');
    }
  }

}