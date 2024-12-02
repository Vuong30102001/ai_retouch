import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'AI Retouch',
      style: TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w700,
        fontSize: 22.sp,
        height: 32 / 22,
        letterSpacing: -0.5,
        color: const Color(0xFFFFFFFF),
      ),
    );
  }
}
