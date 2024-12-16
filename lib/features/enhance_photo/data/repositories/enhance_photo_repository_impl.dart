import 'package:ai_retouch/features/enhance_photo/data/data_source/enhance_photo_data_source.dart';
import 'package:ai_retouch/features/enhance_photo/domain/entities/enhance_photo_entity.dart';
import 'package:ai_retouch/features/enhance_photo/domain/repositories/enhance_photo_repository.dart';

class EnhancePhotoRepositoryImpl implements EnhancePhotoRepository{
  final EnhancePhotoDataSource mediaDataSource;
  EnhancePhotoRepositoryImpl({required this.mediaDataSource});

  @override
  Future<List<EnhancePhotoEntity>> fetchMedia(int page, int size) async {
    return mediaDataSource.getMedia(page, size);
  }
}