import 'dart:convert';

import 'package:ai_retouch/features/restore_old_picture/domain/entities/restore_old_picture_entity.dart';
import 'package:ai_retouch/features/restore_old_picture/data/models/restore_old_picture_model.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:http/http.dart' as http;

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

  final String bareUrl = 'https://picfixer.app/api/em-token/get-token';
  final String restoreUrl = 'https://be-prod-1.snapedit.app/api/restore/v1/';
  Future<String?> getToken() async {
    try {
      final response = await http.get(Uri.parse(bareUrl));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data.containsKey('data') && data['data'].containsKey('em_token')) {
          return data['data']['em_token'];
        } else {
          print('No "em_token" found in response');
        }
      } else {
        print('Failed to get token: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching token: $e');
    }
    return null;
  }


  Future<String> restoreImage(String filePath, String token) async {
    final request = http.MultipartRequest('POST', Uri.parse(restoreUrl))
      ..headers.addAll({
        'Host': 'be-prod-1.snapedit.app',
        'Content-Type': 'multipart/form-data; boundary=alamofire.boundary.7f0585cae229a0a5',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
        'Accept-Language': 'en-VN;q=1.0, vi-VN;q=0.9, vi-JP;q=0.8, zh-Hans-VN;q=0.7',
        'User-Agent': 'SnapEdit/5.2.9 (com.sfun.snapedit; build:626; iOS 17.5.1) Alamofire/5.9.1',
      })
      ..files.add(await http.MultipartFile.fromPath('input_image', filePath))
      ..fields['lang'] = 'en';

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print('Image restored successfully!');
        print('Response Body: $responseBody');

        final jsonResponse = jsonDecode(responseBody);
        if (jsonResponse.containsKey('output_image') &&
            jsonResponse['output_image'].containsKey('image')) {
          return jsonResponse['output_image']['image'];
        } else {
          throw Exception('output_image or image not found in response');
        }
      } else {
        print('Failed to restore image. Status Code: ${response.statusCode}');
        print('Response Body: $responseBody');
        throw Exception('Failed to restore image. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error restoring image: $e');
      throw Exception('Error restoring image: $e');
    }
  }
}