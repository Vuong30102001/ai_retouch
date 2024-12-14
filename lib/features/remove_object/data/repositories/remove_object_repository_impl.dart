import '../../domain/entities/remove_object_entity.dart';
import '../../domain/repositories/remove_object_repository.dart';
import '../data_source/remove_object_data_source.dart';

class RemoveObjectRepositoryImpl implements RemoveObjectRepository{
  final RemoveObjectDataSource removeObjectDataSource;
  RemoveObjectRepositoryImpl({required this.removeObjectDataSource});

  @override
  Future<List<RemoveObjectEntity>> fetchMedia(int page, int size) async {
    return removeObjectDataSource.getMedia(page, size);
  }
}