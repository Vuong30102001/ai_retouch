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
        child: Text(
          'AI Retouch',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            height: 32 / 22,  // Tính toán line height (32 / 22)
            letterSpacing: -0.5,  // Khoảng cách giữa các chữ
          ),
        ),
      ),
    );
  }
}
