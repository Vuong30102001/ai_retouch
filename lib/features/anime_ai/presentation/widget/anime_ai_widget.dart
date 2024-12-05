import 'package:ai_retouch/core/utils/coming_soon/coming_soon_helper.dart';
import 'package:ai_retouch/core/widgets/comming_soon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimeAiWidget extends StatelessWidget {
  const AnimeAiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 690.w,
        left: 137.w,
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
                  width: 24.w,
                  height: 24.w,
                  child: Image.asset(
                    'assets/images/icon_anime_ai.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 44.w,
                  left: 30.w,
                ),
                child: SizedBox(
                  width: 41.w,
                  height: 12.w,
                  child: Text(
                    'Ai Anime',
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
          ),
        ),
      )
    );
  }
}
