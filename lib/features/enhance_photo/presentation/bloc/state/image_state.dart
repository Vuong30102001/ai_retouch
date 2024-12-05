import 'package:equatable/equatable.dart';
import '../../../domain/entities/image_entity.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImagePicked extends ImageState {
  final ImageEntity image;

  const ImagePicked({required this.image});

  @override
  List<Object> get props => [image];
}

class ImageSaved extends ImageState {}

class ImageError extends ImageState {
  final String message;

  const ImageError({required this.message});

  @override
  List<Object> get props => [message];
}