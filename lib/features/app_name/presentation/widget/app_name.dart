import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'AI Retouch',
      style: TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontWeight: FontWeight.w700,
        fontSize: 22,
        height: 32 / 22, // Line height
        letterSpacing: -0.5, // Khoảng cách chữ
      ),
    );
  }
}
