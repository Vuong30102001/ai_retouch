import 'package:ai_retouch/features/home/presentation/widget/app_name_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppNameWidget(),
        ],
      ),
    );
  }
}
