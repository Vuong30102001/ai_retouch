import 'package:flutter/material.dart';

import '../../../app_name/presentation/widget/app_name_widget.dart';
import '../../../pro_button/presentation/widget/pro_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          AppNameWidget(),
          ProButtonWidget(),
        ],
      ),
    );
  }
}
