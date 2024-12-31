import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(top: 44.h),
                child: Container(
                  width: 580.w,
                  height: 96.w,
                  child: Image.asset(
                    'assets/images/sub_1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 580.w,
                height: 90.w,
                child: Image.asset(
                  'assets/images/sub_2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 256.w,
          left: 76.w,
          child: SizedBox(
            width: 222.w,
            height: 26.w,
            child: Text(
              'Unlock all Features',
              style: TextStyle(
                fontSize: 24.sp,
                fontFamily: 'PlusJakartaSans',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
