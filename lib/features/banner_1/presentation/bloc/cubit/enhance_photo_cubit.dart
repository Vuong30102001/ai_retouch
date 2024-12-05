import 'package:ai_retouch/features/banner_1/presentation/bloc/state/enhance_photo_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ai_retouch/features/enhance_photo/presentation/screen/enhance_photo_screen.dart';

class EnhancePhotoCubit extends Cubit<EnhancePhotoState>{
  EnhancePhotoCubit() : super(const EnhancePhotoState());

  void navigatorToPage(BuildContext context, String page){
    emit(state.copyWith(isLoading: true));
    if(page == 'enhance'){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EnhancePhotoScreen()),
      );
    }
    emit(state.copyWith(isLoading: false));
  }
}