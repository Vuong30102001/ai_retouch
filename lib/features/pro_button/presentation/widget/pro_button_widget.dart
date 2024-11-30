import 'package:ai_retouch/core/routing/app_router.dart';
import 'package:ai_retouch/features/pro_button/presentation/widget/pro_image.dart';
import 'package:ai_retouch/features/pro_button/presentation/widget/pro_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProButtonWidget extends StatelessWidget {
  const ProButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 56,
      left: 235,
      child: GestureDetector(
        onTap: () => AppRouter.navigatorToProPage(context),
      child: Container(
        width: 78,
        height: 32,
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
            // Button chính (nền)
            Container(
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            // Khung bên trong
            Positioned(
              top: 8,
              left: 12,
              child: Column(
                children: [
                  Container(
                    width: 53,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 1,
                      ),
                    ),
                    child: const Stack(
                      children: [
                        ProImage(),
                        ProText(),
                      ],
                    )
                  ),
                  const Gap(6),
                ],
              )
            ),
          ],
        ),
      ),
      )
    );
  }
}
