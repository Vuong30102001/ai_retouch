import 'dart:typed_data';

enum MediaType{
  image,
  video
}

class RemoveObjectEntity{
  final String id;
  final Uint8List thumbnail;
  final MediaType mediaType;
  RemoveObjectEntity({required this.id, required this.thumbnail, required this.mediaType});
}