import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProImage extends StatelessWidget {
  const ProImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
          'assets/images/pro.png',
          width: 15.87.w,
          height: 13.13.w,
          fit: BoxFit.fitHeight,
    );
  }
}
