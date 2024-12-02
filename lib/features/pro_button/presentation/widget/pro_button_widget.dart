import 'package:ai_retouch/core/routing/app_router.dart';
import 'package:ai_retouch/features/pro_button/presentation/widget/pro_image.dart';
import 'package:ai_retouch/features/pro_button/presentation/widget/pro_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProButtonWidget extends StatelessWidget {
  const ProButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 56.w,
        left: 235.w,
        child: GestureDetector(
            onTap: () => AppRouter.navigatorToProPage(context),
            child: Container(
                width: 78.w,
                height: 32.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF6E2AFF),
                      Color(0xFF2AB2FF),
                      Color(0xFF2AFFF2),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      Positioned(
                          top: 8.w,
                          left: 12.w,
                          child: Container(
                            width: 53.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                // color: Theme.of(context).scaffoldBackgroundColor,
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                    top: 2.87.w,
                                    left: 0.03.w,
                                  child: Container(
                                    width: 16.w,
                                    height: 16.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      )
                                    ),
                                    child: const ProImage(),
                                  ),
                                ),
                                const Align(
                                      alignment: Alignment.centerRight,
                                      child: ProText(),
                                    ),
                              ],
                            ),
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}

