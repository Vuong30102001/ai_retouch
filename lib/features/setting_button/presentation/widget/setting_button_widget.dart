import 'package:ai_retouch/features/setting_button/presentation/widget/setting_button.dart';
import 'package:flutter/material.dart';

class SettingButtonWidget extends StatelessWidget {
  const SettingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 56,
          left: 325,
          child: Stack(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Positioned(
                  top: 8,
                  left: 8,
                  child: Stack(
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                      ),
                      Positioned(
                          top: 1.5,
                          left: 0.83,
                          child: SettingButton()
                      )
                    ],
                  )
              )
            ],
          )
        ),
      ]
    );
  }
}
