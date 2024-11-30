import 'package:flutter/material.dart';

class ProText extends StatelessWidget {
  const ProText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 0,
      bottom: 0,
      top: 0,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'PRO',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans-Italic',
            fontWeight: FontWeight.w800,
            height: 20/14,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
