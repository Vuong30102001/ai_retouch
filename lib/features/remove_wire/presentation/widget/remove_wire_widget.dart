import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveWireWidget extends StatelessWidget {
  const RemoveWireWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 602.w,
        left: 137.w,
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
                      'assets/images/icon_remove_wire.png',
                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 44.w,
                  left: 19.w,
                ),
                child: SizedBox(
                  width: 63.w,
                  height: 12.w,
                  child: Text(
                    'Remove Wire',
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
