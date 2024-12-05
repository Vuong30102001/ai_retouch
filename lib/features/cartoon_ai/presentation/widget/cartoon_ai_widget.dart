import 'package:ai_retouch/core/utils/coming_soon/coming_soon_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/comming_soon_widget.dart';

class CartoonAiWidget extends StatelessWidget {
  const CartoonAiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 690.w,
        left: 20.w,
      ),
      child: GestureDetector(
        onTap: () => ComingSoonHelper.showComingSoonDialog(context),
        child: Container(
            width: 101.w,
            height: 64.w,
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
            ),
            child: Stack(
              clipBehavior: Clip.none,
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
                        'assets/images/icon_cartoon_ai.png',
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 44.w,
                    left: 25.w,
                  ),
                  child: SizedBox(
                    width: 51.w,
                    height: 12.w,
                    child: Text(
                      'Cartoon Ai',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const CommingSoonWidget(),
              ],
            )
        ),
      )
    );
  }
}
