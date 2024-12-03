import 'package:ai_retouch/features/pro_button/presentation/bloc/state/subscription_state.dart';
import 'package:ai_retouch/features/supscription/presentation/widget/subscription_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscriptionCubit extends Cubit<SubscriptionState>{
  SubscriptionCubit() : super(const SubscriptionState());

  void navigatorToPage(BuildContext context, String page){
    emit(state.copyWith(isLoading: true));
    if(page == 'subscription'){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SubscriptionWidget()),
      );
    }
    emit(state.copyWith(isLoading: false));
  }
}