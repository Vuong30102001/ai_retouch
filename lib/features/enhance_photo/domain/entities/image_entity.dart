import 'dart:typed_data';

class ImageEntity{
  final String path;
  final Uint8List bytes;

  ImageEntity({required this.path,required this.bytes});
}