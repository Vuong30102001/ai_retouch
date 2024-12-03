import 'package:equatable/equatable.dart';

class EnhancePhotoState extends Equatable{
  final bool isLoading;
  final String? errorMessage;
  const EnhancePhotoState({
    this.isLoading = false,
    this.errorMessage
  });

  EnhancePhotoState copyWith({
    final bool? isLoading,
    final String? errorMessage,
  }) {
    return EnhancePhotoState(
      isLoading: isLoading ?? false,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage];
}