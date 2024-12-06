import 'dart:typed_data';
import 'package:ai_retouch/features/enhance_photo/data/model/image_model.dart';
import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


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
    try {
      // Chuyển đổi dữ liệu ảnh thành Uint8List
      Uint8List imageBytes = Uint8List.fromList(image.bytes);

      // Lưu ảnh vào thư viện sử dụng Gal (không cần trả về giá trị)
      await Gal.putImageBytes(imageBytes);

      // Nếu không có lỗi, coi như đã lưu thành công
      return true;
    } catch (e) {
      // Nếu có lỗi, trả về false
      print('Error saving image: $e');
      return false;
    }
  }
}