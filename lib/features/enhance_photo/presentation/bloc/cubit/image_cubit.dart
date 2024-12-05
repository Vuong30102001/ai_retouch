import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';
import 'package:ai_retouch/features/enhance_photo/domain/use_case/pick_image_use_case.dart';
import 'package:ai_retouch/features/enhance_photo/domain/use_case/save_image_use_case.dart';
import 'package:ai_retouch/features/enhance_photo/domain/use_case/smooth_image_use_case.dart';
import 'package:ai_retouch/features/enhance_photo/presentation/bloc/state/image_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCubit extends Cubit<ImageState>{
  final PickImageUseCase pickImageUseCase;
  final SmoothImageUseCase smoothImageUseCase;
  final SaveImageUseCase saveImageUseCase;
  ImageCubit({
    required this.pickImageUseCase,
    required this.smoothImageUseCase,
    required this.saveImageUseCase
  }) : super(ImageInitial());

  Future<void> pickImage() async {
    try{
      emit(ImageLoading());
      final image = await pickImageUseCase.execute();
      emit(ImagePicked(image: image));
    }
    catch(e){
      emit(ImageError(message: e.toString()));
    }
  }

  Future<void> smoothImage(ImageEntity image) async {
    try{
      emit(ImageLoading());
      final newImage = await smoothImageUseCase.execute(image);
      emit(ImagePicked(image: newImage));
    }
    catch(e){
      emit(ImageError(message: e.toString()));
    }
  }

  Future<void> saveImage(ImageEntity image) async {
    try {
      emit(ImageLoading());
      final success = await saveImageUseCase.execute(image);
      if (success) {
        emit(ImageSaved());
      } else {
        emit(const ImageError(message: 'Failed to save image'));
      }
    } catch (e) {
      emit(ImageError(message: 'Error saving image: $e'));
    }
  }
}