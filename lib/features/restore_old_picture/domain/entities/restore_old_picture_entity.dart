import 'dart:typed_data';

import 'package:photo_manager/photo_manager.dart';

enum MediaType{
  image,
  video,
  unknown,
}

class RestoreOldPictureEntity{
  final String id;
  final Uint8List thumbnail;
  final MediaType mediaType;

  RestoreOldPictureEntity({required this.id, required this.thumbnail, required this.mediaType});

  static Future<RestoreOldPictureEntity> fromAssetEntity(AssetEntity asset) async {
    final Uint8List? thumbnail = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));

    final MediaType mediaType;

    switch (asset.type) {
      case AssetType.image:
        mediaType = MediaType.image;
        break;
      case AssetType.video:
        mediaType = MediaType.video;
        break;
      default:
        mediaType = MediaType.unknown;
    }
    return RestoreOldPictureEntity(
        id: asset.id,
        thumbnail: thumbnail!,
        mediaType: mediaType,
    );
  }
}