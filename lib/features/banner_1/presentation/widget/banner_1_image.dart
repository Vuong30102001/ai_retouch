import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Banner1Image extends StatelessWidget {
  const Banner1Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/banner_1_image.png',
      width: 335.w,
      height: 250.w,
      fit: BoxFit.cover,
    );
  }
}
