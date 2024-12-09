import 'package:ai_retouch/features/enhance_photo/data/data_source/media_data_source.dart';
import 'package:ai_retouch/features/enhance_photo/domain/entities/media_entity.dart';
import 'package:ai_retouch/features/enhance_photo/domain/repositories/media_repository.dart';

class MediaRepositoryImpl implements MediaRepository{
  final MediaDataSource mediaDataSource;
  MediaRepositoryImpl({required this.mediaDataSource});

  @override
  Future<List<MediaEntity>> fetchMedia(int page, int size) async {
    return mediaDataSource.getMedia(page, size);
  }
}