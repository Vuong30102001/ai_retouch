import 'package:flutter/material.dart';

class ProImage extends StatelessWidget {
  const ProImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 2.87,
      left: 0.03,
      child: Image.asset(
        'assets/images/pro.png',
        width: 15.87  ,
        height: 13.13,
        fit: BoxFit.contain,
      ),
    );
  }
}
