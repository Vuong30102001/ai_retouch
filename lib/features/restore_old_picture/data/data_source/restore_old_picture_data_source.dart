import 'package:ai_retouch/features/restore_old_picture/domain/entities/restore_old_picture_entity.dart';
import 'package:ai_retouch/features/restore_old_picture/data/models/restore_old_picture_model.dart';
import 'package:photo_manager/photo_manager.dart';

class RestoreOldPictureDataSource{
  Future<List<AssetPathEntity>> getAlbums(){
    return PhotoManager.getAssetPathList(type: RequestType.common);
  }

  Future<List<RestoreOldPictureModel>> getMedias(int page, int size) async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final medias = await albums[0].getAssetListPaged(page: page, size: size);
    return Future.wait(medias.map((asset) async {
      final thumbnail = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
      return RestoreOldPictureModel(
          id: asset.id,
          thumbnail: thumbnail!,
          mediaType: _mapAssetToMediaType(asset.type),
      );
    }).toList());
  }

  MediaType _mapAssetToMediaType(AssetType type){
    switch(type){
      case AssetType.image:
        return MediaType.image;
      case AssetType.video:
        return MediaType.video;
      default:
        throw UnsupportedError('Unsupported media type: $type');
    }
  }
}