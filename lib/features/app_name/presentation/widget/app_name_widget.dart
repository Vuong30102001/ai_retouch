import 'package:ai_retouch/features/app_name/presentation/widget/app_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 56.w,
        left: 20.w,
      ),
      child: Container(
        width: 112.w,
        height: 32.w,
        child: const AppName(),
      ),
    );
  }
}
