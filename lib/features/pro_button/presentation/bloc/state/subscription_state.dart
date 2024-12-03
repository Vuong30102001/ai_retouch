import 'package:equatable/equatable.dart';

class SubscriptionState extends Equatable{
  final bool isLoading;
  final String? errorMessage;
  const SubscriptionState({
    this.isLoading = false,
    this.errorMessage
  });

  SubscriptionState copyWith({
    final bool? isLoading,
    final String? errorMessage,
  }) {
    return SubscriptionState(
      isLoading: isLoading ?? false,
      errorMessage: errorMessage
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage];
}