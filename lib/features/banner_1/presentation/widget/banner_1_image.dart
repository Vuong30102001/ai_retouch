import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Banner1Image extends StatelessWidget {
  const Banner1Image({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 115.14.w,
      left: 144.w,
      child: Container(
        width: 105.w,
        height: 129.w,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF).withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 3.w,
            color: Color(0xFFFFFFFF).withOpacity(0.2),
          ),
        ),
        child: Transform.rotate(
          angle: degreeToRadian(6.64),
          child: Image.asset(
            'assets/images/image_banner_1.png',
            width: 105.w,
            height: 129.w,
          ),
        ),
      ),
    );
  }
}

double degreeToRadian(double degree) {
  return degree * (3.14159265359 / 180);
}
