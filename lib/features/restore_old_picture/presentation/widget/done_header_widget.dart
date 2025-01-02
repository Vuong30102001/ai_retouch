import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoneHeaderWidget extends StatelessWidget {
  const DoneHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 48.w,
      color: const Color(0xFF1A1A1A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Container(
                width: 32.w,
                height: 32.w,
                color: const Color(0xFF1A1A1A),
                child: Image.asset('assets/images/BTN.png'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Container(
                width: 70.w,
                height: 32.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    'Save',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'PlusJakartaSans',
                      color: Colors.white,
                    ),
                  ),
                )
            )
          ),
        ],
      ),
    );
  }
}
