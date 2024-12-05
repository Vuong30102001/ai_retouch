import 'package:ai_retouch/features/banner_1/presentation/widget/banner_1_image.dart';
import 'package:ai_retouch/features/banner_1/presentation/widget/banner_button.dart';
import 'package:ai_retouch/features/banner_1/presentation/widget/banner_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Banner1Widget extends StatelessWidget {
  const Banner1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 100.w,
        left: 20.w,
      ),
      child: Container(
        width: 335.w,
        height: 250.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: const [
            Banner1Image(),
            BannerText(),
            BannerButton(),
          ],
        ),
      ),
    );
  }
}
