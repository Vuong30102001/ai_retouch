import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TouchRemoveWidget extends StatelessWidget {
  const TouchRemoveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 480.w,
        left: 192.w,
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
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 24.w,
                  left: 24.w,
                ),
                child: Image.asset(
                  'assets/images/icon_touch_remove.png',
                  width: 24.w,
                  height: 24.w,
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(
                    top: 68.w,
                    left: 16.w,
                  ),
                  child: SizedBox(
                    width: 90.w,
                    height: 14.w,
                    child: Text(
                      '1 Touch Remove',
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
      ),
    );
  }
}
