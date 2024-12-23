import 'package:ai_retouch/features/enhance_photo/domain/entities/enhance_photo_entity.dart';
import 'package:photo_manager/photo_manager.dart';

import '../models/enhance_photo_model.dart';

class EnhancePhotoDataSource{
  Future<List<AssetPathEntity>> getAlbums() {
    return PhotoManager.getAssetPathList(type: RequestType.common);
  }
  Future<List<EnhancePhotoModel>> getMedia(int page, int size) async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final media = await albums[0].getAssetListPaged(page: page, size: size);
    
    return Future.wait(media.map((asset) async {
      final thumbnail = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
      return EnhancePhotoModel(
          id: asset.id,
          thumbnail: thumbnail!,
          media: _mapAssetTypeToMediaType(asset.type),
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