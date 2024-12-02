import 'package:ai_retouch/features/banner_1/presentation/widget/banner_1_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Banner1Widget extends StatelessWidget {
  const Banner1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 100.w,
          left: 20.w,
          child: Container(
            width: 335.w,
            height: 250.w,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFF737373),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Stack(
              children: [
                Banner1Image(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
