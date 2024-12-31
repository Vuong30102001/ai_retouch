import 'package:ai_retouch/features/subscription/presentation/screen/subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState>{
  SubscriptionCubit() : super(const SubscriptionState());

  void navigatorToPage(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SubscriptionScreen()),
    );
    emit(state.copyWith(isLoading: false));
  }
}
