import 'dart:typed_data';

enum MediaType{
  image,
  video,
}

class MediaEntity{
  final String id;
  final Uint8List thumbnail;
  final MediaType mediaType;
  MediaEntity({required this.id, required this.thumbnail, required this.mediaType});
}