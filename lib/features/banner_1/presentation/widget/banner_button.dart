import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stroke_text/stroke_text.dart';
import '../bloc/cubit/banner_1_cubit.dart';

class BannerButton extends StatelessWidget {
  const BannerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 134.w,
      left: 12.w,
        child: GestureDetector(
          onTap: () {
            context.read<Banner1Cubit>().navigatorToPage(context, 'enhance');
          },

        child: Container(
            width: 100.w,
            height: 32.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(
                colors: [
                  Color(0xFFE3DCFF),
                  Color(0xFFFFFFFF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 9.w,
                left: 28.w,
              ),
              child: SizedBox(
                width: 47.w,
                height: 14.w,
                child: StrokeText(
                  text: 'Try Now',
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontFamily: 'BeckyTahlia'
                  ),
                ),
              ),
            )
        ),
      )
    );
  }
}
