import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonePopupWidget extends StatelessWidget {
  const DonePopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 80.w,
      color: const Color(0xFF1A1A1A),
      child: Center(
        child: Container(
          width: 286.w,
          height: 17.w,
          child: Row(
            children: [
              SizedBox(
                width: 17.w,
                height: 17.w,
                child: Image.asset('assets/images/Done.png'),
              ),
              SizedBox(
                width: 263.w,
                height: 14.w,
                child: Text(
                  'Restore Old Pic done! Hope you enjoy it',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontFamily: 'PlusJakartaSans',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
