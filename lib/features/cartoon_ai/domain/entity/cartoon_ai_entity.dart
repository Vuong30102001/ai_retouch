import 'dart:typed_data';

enum MediaType{
  image,
  video,
  unknown,
}

class CartoonAiEntity{
  final String id;
  final Uint8List thumbnail;
  final MediaType mediaType;

  CartoonAiEntity({required this.id, required this.thumbnail, required this.mediaType});
}