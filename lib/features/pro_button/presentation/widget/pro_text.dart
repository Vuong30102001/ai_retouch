import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProText extends StatelessWidget {
  const ProText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 31.w,
      height: 10.w,
      child: Text(
        'PRO',
        style: TextStyle(
          fontFamily: 'PlusJakartaSans-Italic',
          fontWeight: FontWeight.w800,
          // height: 20/14,
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
