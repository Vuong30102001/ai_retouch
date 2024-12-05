import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -4.w,
      left: 48.w,
      child: Container(
        width: 59.w,
        height: 12.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                Color(0xFF4A4A4A),
                Color(0xFF999999),
              ],
            )
        ),
        child: Padding(
            padding: EdgeInsets.only(
              top: 0,
              left: 4.w,
            ),
            child: Container(
              width: 51.w,
              height: 12.w,
              child: Text(
                'Coming Soon',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 8.sp,
                  color: Colors.white,
                ),
              ),
            )
        ),
      ),
    );
  }
}
