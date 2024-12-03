import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroke_text/stroke_text.dart';


class BannerText extends StatelessWidget {
  const BannerText({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: EdgeInsets.only(
          top: 80.w,
          left: 12.w,
        ),
      child: SizedBox(
        width: 158.w,
        height: 44.w,
        child: StrokeText(
          text: 'Enhance your photo quality',
          textStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'BeckyTahlia',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          strokeColor: Colors.white.withOpacity(0.5),
          strokeWidth: 0.5,
        ),
      ),
    );
  }
}
