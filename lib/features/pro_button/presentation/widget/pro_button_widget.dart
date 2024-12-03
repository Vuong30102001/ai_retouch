import 'package:ai_retouch/features/pro_button/presentation/bloc/cubit/subscription_cubit.dart';
import 'package:ai_retouch/features/pro_button/presentation/widget/pro_image.dart';
import 'package:ai_retouch/features/pro_button/presentation/widget/pro_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProButtonWidget extends StatelessWidget {
  const ProButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 56.w,
      left: 235.w,
      child: GestureDetector(
        onTap: () {
          context.read<SubscriptionCubit>().navigatorToPage(context, 'subscription');
        },
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
                margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 53.w,
                  height: 16.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Thay đổi cấu trúc của Container và Row
                      SizedBox(
                        width: 16.w,
                        height: 16.w,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 2.87.w,
                            left: 0.03.w,
                          ),
                          child: const ProImage(), // Dùng ProImage bên trong container
                        ),
                      ),
                      // Thêm ProText bên cạnh ProImage mà không cần SizedBox
                      SizedBox(
                        width: 31.w,
                        height: 10.w,
                        child: const ProText(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
