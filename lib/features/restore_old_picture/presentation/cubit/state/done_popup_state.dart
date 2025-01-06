import 'package:equatable/equatable.dart';

class DonePopupState extends Equatable{
  final bool isLoading;
  final String? successMessage;
  final String? errorMessage;

  DonePopupState({
    required this.isLoading,
    required this.successMessage,
    required this.errorMessage,
  });

  factory DonePopupState.initial(){
    return DonePopupState(
      isLoading: false,
      successMessage: null,
      errorMessage: null,
    );
  }

  DonePopupState copyWith({
    bool? isLoading,
    String? successMessage,
    String? errorMessage,
  }) {
    return DonePopupState(
      isLoading: isLoading ?? this.isLoading,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, successMessage, errorMessage];
}