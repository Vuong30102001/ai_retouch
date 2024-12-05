import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';
import 'package:ai_retouch/features/enhance_photo/domain/repositories/image_repository.dart';

class SaveImageUseCase{
  final ImageRepository imageRepository;
  SaveImageUseCase(this.imageRepository);

  Future<bool> execute(ImageEntity image) async {
    return await imageRepository.saveImage(image);
  }
}