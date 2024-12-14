import 'package:photo_manager/photo_manager.dart';

import '../../domain/entities/remove_object_entity.dart';

class RemoveObjectDataSource{
  Future<List<RemoveObjectEntity>> getMedia(int page, int size) async {
    final albums = await PhotoManager.getAssetPathList();
    final medias = await albums[0].getAssetListPaged(page: page, size: size);

    return Future.wait(medias.map((asset) async {
      final thumbnail = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
      return RemoveObjectEntity(
          id: asset.id,
          thumbnail: thumbnail!,
          mediaType: _mapAssetTypeToMediaType(asset.type),
      );
    }));
  }

  MediaType _mapAssetTypeToMediaType(AssetType type){
    switch(type){
      case AssetType.image:
        return MediaType.image;
      case AssetType.video:
        return MediaType.video;
      default:
        throw UnsupportedError('Unsupported media type $type');
    }
  }
}