import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ai_retouch/features/enhance_photo/domain/entities/image_entity.dart';
import 'package:ai_retouch/features/enhance_photo/presentation/bloc/state/image_state.dart';
import 'package:ai_retouch/features/enhance_photo/presentation/bloc/cubit/image_cubit.dart';

class EnhancePhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enhance Photo'),
      ),
      body: BlocProvider(
        create: (context) => ImageCubit(
          pickImageUseCase: context.read(),
          smoothImageUseCase: context.read(),
          saveImageUseCase: context.read(),
        ),
        child: BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            if (state is ImageLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ImageError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is ImagePicked) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.memory(state.image.bytes),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _smoothImage(context, state.image),
                    child: const Text('Smooth Image'),
                  ),
                  ElevatedButton(
                    onPressed: () => _saveImage(context, state.image),
                    child: const Text('Save Image'),
                  ),
                ],
              );
            } else {
              return Center(
                child: ElevatedButton(
                  onPressed: () => _pickImage(context),
                  child: const Text('Pick Image'),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // Pick an image
  Future<void> _pickImage(BuildContext context) async {
    context.read<ImageCubit>().pickImage();
  }

  // Apply smooth filter
  Future<void> _smoothImage(BuildContext context, ImageEntity image) async {
    context.read<ImageCubit>().smoothImage(image);
  }

  // Save the image
  Future<void> _saveImage(BuildContext context, ImageEntity image) async {
    context.read<ImageCubit>().saveImage(image);
  }
}
