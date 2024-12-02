import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Banner1Image extends StatelessWidget {
  const Banner1Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 115.14.w,
      left: 144.w,
      child: Transform.rotate(
        angle: degreeToRadian(-6.64),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
              'assets/images/image_banner_1.png',
              width: 105.w,
              height: 129.w,
              fit: BoxFit.cover,
            ),
          ),
        ),
    );
  }
}

double degreeToRadian(double degree) {
  return degree * (3.14159265359 / 180);
}
