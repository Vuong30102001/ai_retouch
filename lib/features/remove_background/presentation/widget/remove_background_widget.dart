import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveBackgroundWidget extends StatelessWidget {
  const RemoveBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 374.w,
        left: 192.w,
        child: Container(
            width: 163.w,
            height: 98.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Stack(
              clipBehavior: Clip.none,
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
                Positioned(
                  top: -6.w,
                  left: 96.w,
                  child: Container(
                    width: 72.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF4A4A4A),
                          Color(0xFFFFFFFF),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 4.w,
                        left: 4.w,
                      ),
                      child: SizedBox(
                        width: 64.w,
                        height: 12.w,
                        child: const Text(
                          'Coming Soon',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 24.w,
                    left: 24.w,
                  ),
                  child: Image.asset(
                    'assets/images/icon_remove_background.png',
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
                      width: 120.w,
                      height: 14.w,
                      child: Text(
                        'Remove Background',
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
