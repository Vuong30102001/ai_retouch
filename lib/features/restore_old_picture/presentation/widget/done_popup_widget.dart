import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/done_popup_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/state/done_popup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonePopupWidget extends StatelessWidget {
  const DonePopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonePopupCubit, DonePopupState>(
        builder: (context, state) {
          if (state.isLoading) {
            return _buildLoading();
          }
          else if (state.successMessage != null) {
            return _buildSuccess(state.successMessage!);
          }
          else if (state.errorMessage != null) {
            return _buildError(state.errorMessage!);
          }
          else {
            return const SizedBox.shrink();
          }
        }
    );
  }

  Widget _buildLoading() {
    return Container(
      width: 375.w,
      height: 80.w,
      color: const Color(0xFF1A1A1A),
      child: Center(
        child: Container(
          width: 77.w,
          height: 16.w,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: const CircularProgressIndicator(color: Colors.white),
                ),
                SizedBox(
                  width: 55.w,
                  height: 18.w,
                  child: Text(
                    'Loading',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ),
        )
      ),
    );
  }

  Widget _buildSuccess(String message) {
    return Container(
      width: 375.w,
      height: 80.w,
      color: const Color(0xFF1A1A1A),
      child: Center(
        child: Container(
          width: 286.w,
          height: 17.w,
          child: Row(
            children: [
              SizedBox(
                width: 17.w,
                height: 17.w,
                child: Image.asset('assets/images/Done.png'),
              ),
              SizedBox(
                width: 263.w,
                height: 14.w,
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildError(String error) {
    return Container(
      width: 375.w,
      height: 80.w,
      color: const Color(0xFF1A1A1A),
      child: Center(
        child: Container(
          width: 276.w,
          height: 16.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 16.w,
                height: 16.w,
                child: Image.asset('assets/images/Error.png'),
              ),
              Container(
                width: 254.w,
                height: 10.w,
                child: Text(
                  'An error has occurred, please try again',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
