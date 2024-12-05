import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';
import 'package:ai_retouch/features/enhance_photo/domain/repositories/image_repository.dart';

class PickImageUseCase{
  final ImageRepository imageRepository;
  PickImageUseCase(this.imageRepository);

  Future<ImageEntity> execute() async {
    return await imageRepository.pickImage();
  }
}