import 'package:equatable/equatable.dart';

class Banner1State extends Equatable{
  final bool isLoading;
  final String? errorMessage;
  const Banner1State({
    this.isLoading = false,
    this.errorMessage
  });

  Banner1State copyWith({
    final bool? isLoading,
    final String? errorMessage,
  }) {
    return Banner1State(
      isLoading: isLoading ?? false,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage];
}