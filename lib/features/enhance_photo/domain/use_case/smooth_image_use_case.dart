import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';
import 'package:ai_retouch/features/enhance_photo/domain/repositories/image_repository.dart';

class SmoothImageUseCase{
  final ImageRepository imageRepository;
  SmoothImageUseCase(this.imageRepository);

  Future<ImageEntity> execute(ImageEntity image) async {
    return await imageRepository.smoothImage(image);
  }
}