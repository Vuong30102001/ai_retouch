import 'package:ai_retouch/features/enhance_photo/domain/entities/media_entity.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaDataSource{
  Future<List<MediaEntity>> getMedia(int page, int size) async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final media = await albums[0].getAssetListPaged(page: page, size: size);
    
    return Future.wait(media.map((asset) async {
      final thumbnail = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
      return MediaEntity(
          id: asset.id,
          thumbnail: thumbnail!,
          mediaType: _mapAssetTypeToMediaType(asset.type),
      );
    }).toList());
  }

  MediaType _mapAssetTypeToMediaType(AssetType type){
    switch (type){
      case AssetType.image:
        return MediaType.image;
      case AssetType.video:
        return MediaType.video;
      default:
        throw UnsupportedError('Unsupported media type: $type');
    }
  }
}