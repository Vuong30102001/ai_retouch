import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnhancePhotoWidget extends StatelessWidget {
  const EnhancePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 480.w,
        left: 20.w,
      ),
        child: Container(
            width: 163.w,
            height: 98.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 16.w,
                    left: 16.w,
                  ),
                  child: Image.asset(
                    'assets/images/icon_enhance_photo.png',
                    width: 40.w,
                    height: 40.w,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 68.w,
                      left: 16.w,
                    ),
                    child: SizedBox(
                      width: 87.w,
                      height: 14.w,
                      child: Text(
                        'Enhance Photo',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    )
                )
              ],
            )
        )
    );
  }
}
