import 'package:ai_retouch/features/banner_1/presentation/widget/banner_1_widget.dart';
import 'package:ai_retouch/features/setting_button/presentation/widget/setting_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          SettingButtonWidget(),
          Banner1Widget(),
        ],
      ),
    );
  }
}
