import 'package:ai_retouch/features/banner_1/presentation/bloc/state/enhance_photo_state.dart';
import 'package:ai_retouch/features/enhance_photo/presentation/widget/enhance_photo_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class EnhancePhotoCubit extends Cubit<EnhancePhotoState>{
  EnhancePhotoCubit() : super(const EnhancePhotoState());

  void navigatorToPage(BuildContext context, String page){
    emit(state.copyWith(isLoading: true));
    if(page == 'enhance'){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EnhancePhotoWidget()),
      );
    }
    emit(state.copyWith(isLoading: false));
  }
}