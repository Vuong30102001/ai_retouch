import 'package:ai_retouch/features/banner_1/presentation/bloc/state/banner_1_state.dart';
import 'package:ai_retouch/features/enhance_photo/presentation/screen/album_enhance_media_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class Banner1Cubit extends Cubit<Banner1State>{
  Banner1Cubit() : super(const Banner1State());

  void navigatorToPage(BuildContext context, String page) async {
    emit(state.copyWith(isLoading: true));
    if(page == 'enhance'){
      await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlbumEnhanceMediaScreen()),
      );
    }
    emit(state.copyWith(isLoading: false));
  }
}