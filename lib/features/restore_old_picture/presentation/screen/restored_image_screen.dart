import 'dart:io';
import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/done_popup_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/restore_old_picture_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/widget/done_header_widget.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/widget/done_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestoredImageScreen extends StatelessWidget {
  final String base64Image;

  const RestoredImageScreen({super.key, required this.base64Image});

  @override
  Widget build(BuildContext context) {
    context.read<DonePopupCubit>().showLoading();

    return FutureBuilder<File>(
      future: context.read<RestoreOldPictureCubit>().convertBase64StrToFile(base64Image),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Stack(
              children: [
                const Center(child: CircularProgressIndicator()),
                Positioned(
                  top: 680.w,
                  child: const DonePopupWidget(),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          context.read<DonePopupCubit>().showError('Failed to restore image');
          return Scaffold(
            body: Stack(
              children: [
                Center(child: Text('Error: ${snapshot.error}')),
                Positioned(
                  top: 680.w,
                  child: const DonePopupWidget(),
                ),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          context.read<DonePopupCubit>().showSuccess('Restore Old Pic done! Hope you enjoy it');
          final imageFile = snapshot.data!;
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  top: 41.w,
                  child: const DoneHeaderWidget(),
                ),
                Positioned(
                  top: 109.w,
                  left: 20.w,
                  child: Container(
                    width: 58.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white.withOpacity(0.5)
                    ),
                    child: Center(
                      child: Text(
                        'Before',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 109.w,
                  left: 297.w,
                  child: Container(
                    width: 58.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: Center(
                      child: Text(
                        'Before',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 89.w,
                  child: Container(
                    width: 375.w,
                    height: 591.w,
                    child: Center(
                      child: Image.file(imageFile),
                    )
                  ),
                ),
                Positioned(
                  top: 680.w,
                  child: const DonePopupWidget(),
                ),
              ],
            ),
          );
        }
        return Center(child: Text('No image found'));
      },
    );
  }
}
