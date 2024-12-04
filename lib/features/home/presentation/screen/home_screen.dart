import 'package:ai_retouch/features/banner_1/presentation/widget/banner_1_widget.dart';
import 'package:ai_retouch/features/enhance_photo/presentation/widget/enhance_photo_widget.dart';
import 'package:ai_retouch/features/remove_background/presentation/widget/remove_background_widget.dart';
import 'package:ai_retouch/features/remove_object/presentation/widget/remove_object_widget.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/widget/restore_old_picture_widget.dart';
import 'package:ai_retouch/features/setting_button/presentation/widget/setting_button_widget.dart';
import 'package:ai_retouch/features/touch_remove/presentation/widget/touch_remove_widget.dart';
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
          SettingButtonWidget(),
          Banner1Widget(),
          EnhancePhotoWidget(),
          RemoveObjectWidget(),
          RemoveBackgroundWidget(),
          TouchRemoveWidget(),
          RestoreOldPictureWidget(),
        ],
      ),
    );
  }
}
