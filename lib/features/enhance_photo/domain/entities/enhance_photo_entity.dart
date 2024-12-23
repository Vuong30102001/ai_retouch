import 'dart:typed_data';

enum MediaType{
  image,
  video,
  unknown,
}

class EnhancePhotoEntity{
  final String id;
  final Uint8List thumbnail;
  final MediaType mediaType;
  EnhancePhotoEntity({required this.id, required this.thumbnail, required this.mediaType});
}