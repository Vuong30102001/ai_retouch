import 'package:ai_retouch/features/setting_button/presentation/widget/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 56.w,
          left: 325.w
      ),
      child: Container(
        width: 32.w,
        height: 32.w,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: SizedBox(
            width: 16.w,
            height: 16.w,
            child: const SettingButton(),
          ),
        ),
      ),
    );
  }
}
