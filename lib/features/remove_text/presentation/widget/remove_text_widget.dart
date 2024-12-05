import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveTextWidget extends StatelessWidget {
  const RemoveTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 602.w,
        left: 254.w,
      ),
      child: Container(
          width: 101.w,
          height: 64.w,
          decoration: BoxDecoration(
            color: Color(0xFF1A1A1A),
          ),
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    top: 8.w,
                    left: 38.w,
                  ),
                  child: Container(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'assets/images/icon_remove_text.png',
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 44.w,
                  left: 20.w,
                ),
                child: SizedBox(
                  width: 60.w,
                  height: 12.w,
                  child: Text(
                    'Remove Text',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 10.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
