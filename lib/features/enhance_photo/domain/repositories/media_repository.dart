import 'package:ai_retouch/features/enhance_photo/domain/entities/media_entity.dart';

abstract class MediaRepository{
  Future<List<MediaEntity>> fetchMedia(int page, int size);
}