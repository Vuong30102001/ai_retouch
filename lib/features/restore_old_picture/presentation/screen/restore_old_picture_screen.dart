import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestoreOldPictureScreen extends StatelessWidget {
  const RestoreOldPictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 41.0),
          child: Container(
            width: 375.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20.0),
              child: Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A1A),
                ),
                child: Image.asset('assets/images/BTN.png'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
