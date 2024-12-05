import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';

abstract class ImageRepository{
  Future<ImageEntity> pickImage();
  Future<ImageEntity> smoothImage(ImageEntity image);
  Future<bool> saveImage(ImageEntity image);
}