import 'dart:io';
import 'package:ai_retouch/features/restore_old_picture/presentation/cubit/cubit/restore_old_picture_cubit.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/widget/done_header_widget.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/widget/done_popup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestoredImageScreen extends StatelessWidget {
  final String base64Image;

  const RestoredImageScreen({super.key, required this.base64Image});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: context.read<RestoreOldPictureCubit>().convertBase64StrToFile(base64Image),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          final imageFile = snapshot.data!;
          return Stack(
            children: [
              Positioned(
                top: 41.w,
                child: const DoneHeaderWidget(),
              ),
              Positioned(
                top: 89.w,
                child: Container(
                  width: 375.w,
                  height: 591.w,
                  child: Image.file(imageFile),
                ),
              ),
              Positioned(
                top: 680.w,
                child: const DonePopupWidget(),
              )
            ],
          );
        }
        return Center(child: Text('No image found'));
      },
    );
  }
}
