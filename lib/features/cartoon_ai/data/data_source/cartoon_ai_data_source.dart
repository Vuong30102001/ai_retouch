import 'package:ai_retouch/features/cartoon_ai/data/model/cartoon_ai_model.dart';
import 'package:ai_retouch/features/cartoon_ai/domain/entity/cartoon_ai_entity.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../domain/entity/cartoon_style.dart';

class CartoonAiDataSource{
  Future<List<AssetPathEntity>> getAlbums() {
    return PhotoManager.getAssetPathList();
  }

  Future<List<CartoonAiModel>> getMedias(int page, int size) async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final medias = await albums[0].getAssetListPaged(page: page, size: size);
    return Future.wait(medias.map((asset) async {
      final thumbnail = await asset.thumbnailDataWithSize(const ThumbnailSize(200, 200));
      return CartoonAiModel(
          id: asset.id,
          thumbnail: thumbnail!,
          mediaType: _mapAssetToMediaType(asset.type),
      );
    }));
  }

  MediaType _mapAssetToMediaType(AssetType type){
    switch(type){
      case AssetType.image:
        return MediaType.image;
      case AssetType.video:
        return MediaType.video;
      default:
        return MediaType.unknown;
    }
  }

  //function return list styles cartoon ai
  Future<List<CartoonStyle>> fetchStyles() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      CartoonStyle(uuid: "anime_cute", name: "Anime Cute"),
      CartoonStyle(uuid: "fpst/wave", name: "Wave Style"),
      CartoonStyle(uuid: "anime_hot", name: "Anime Hot"),
      CartoonStyle(uuid: "anime_slay", name: "Anime Slay"),
    ];
  }

  //function update image & return String Path updated image
  Future<String> uploadImage(String imagePath, String styleId) async {
    await Future.delayed(const Duration(seconds: 2));

    return "https://api.com/cartoon/${styleId}_image.jpg";
  }
}