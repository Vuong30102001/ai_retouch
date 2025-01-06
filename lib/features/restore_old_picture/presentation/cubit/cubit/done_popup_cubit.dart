import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/state/done_popup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonePopupCubit extends Cubit<DonePopupState>{
  DonePopupCubit() : super(DonePopupState.initial());

  void showLoading(){
    emit(state.copyWith(isLoading: true, successMessage: null, errorMessage: null));
  }

  void showSuccess(String message){
    emit(state.copyWith(isLoading: false, successMessage: message, errorMessage: null));
  }

  void showError(String error){
    emit(state.copyWith(isLoading: false, successMessage: null, errorMessage: error));
  }
}