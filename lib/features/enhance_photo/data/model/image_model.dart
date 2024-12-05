import 'dart:typed_data';
import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';

class ImageModel{
  final String path;
  final Uint8List bytes;
  ImageModel({required this.path, required this.bytes});

  ImageEntity toEntity(){
    return ImageEntity(path: path, bytes: bytes);
  }
}