import 'package:ai_retouch/features/app_name/presentation/widget/app_name.dart';
import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 56,
      left: 20,
      child: Container(
        width: 112,
        height: 32,
        child: const AppName(),
      ),
    );
  }
}
