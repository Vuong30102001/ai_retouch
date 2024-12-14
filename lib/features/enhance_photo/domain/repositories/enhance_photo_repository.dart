import 'package:ai_retouch/features/enhance_photo/domain/entities/enhance_photo_entity.dart';

abstract class EnhancePhotoRepository{
  Future<List<EnhancePhotoEntity>> fetchMedia(int page, int size);
}