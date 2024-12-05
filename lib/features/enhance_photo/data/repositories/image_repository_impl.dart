import 'package:ai_retouch/features/enhance_photo/data/data_source/image_data_source.dart';
import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';
import 'package:ai_retouch/features/enhance_photo/domain/repositories/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository{
  final ImageDataSource imageDataSource;
  ImageRepositoryImpl(this.imageDataSource);

  @override
  Future<ImageEntity> pickImage() async {
    return await imageDataSource.pickImage();
  }

  @override
  Future<ImageEntity> smoothImage(ImageEntity image) async {
    return await imageDataSource.smoothImage(image);
  }

  @override
  Future<bool> saveImage(ImageEntity image) async {
    return await imageDataSource.saveImage(image);
  }
}