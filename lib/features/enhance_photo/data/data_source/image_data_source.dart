import 'dart:typed_data';
import 'package:ai_retouch/features/enhance_photo/data/model/image_model.dart';
import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';


abstract class ImageDataSource {
  Future<ImageEntity> pickImage();
  Future<ImageEntity> smoothImage(ImageEntity image);
  Future<bool> saveImage(ImageEntity image);
}

class ImageDataSourceImpl implements ImageDataSource{
  final ImagePicker _imagePicker;
  ImageDataSourceImpl(this._imagePicker);

  @override
  Future<ImageEntity> pickImage() async {
    final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      final imageBytes = await pickedFile.readAsBytes();
      final imageModel = ImageModel(path: pickedFile.path, bytes: imageBytes);
      return imageModel.toEntity();
    }
    else
      {
        throw Exception('No image selected');
      }
  }

  @override
  Future<ImageEntity> smoothImage(ImageEntity image) async {
    return image;
  }

  @override
  Future<bool> saveImage(ImageEntity image) async {
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(image.bytes));
    return result['isSuccess'] ?? false;
  }
}