import '../entities/remove_object_entity.dart';

abstract class RemoveObjectRepository{
  Future<List<RemoveObjectEntity>> fetchMedia(int page, int size);
}