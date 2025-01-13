import 'dart:io';

import 'package:ai_retouch/core/ads/interstitial_ads/interstitial_ad_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../core/ads/banner/my_banner_ad_widget.dart';
import '../../../app_name/presentation/widget/app_name_widget.dart';
import '../../../pro_button/presentation/widget/pro_button_widget.dart';
import 'package:ai_retouch/features/setting_button/presentation/widget/setting_button_widget.dart';
import 'package:ai_retouch/features/banner_1/presentation/widget/banner_1_widget.dart';

import 'package:ai_retouch/features/enhance_photo/presentation/widget/enhance_photo_widget.dart';
import 'package:ai_retouch/features/remove_object/presentation/widget/remove_object_widget.dart';
import 'package:ai_retouch/features/remove_background/presentation/widget/remove_background_widget.dart';
import 'package:ai_retouch/features/touch_remove/presentation/widget/touch_remove_widget.dart';
import 'package:ai_retouch/features/restore_old_picture/presentation/widget/restore_old_picture_widget.dart';
import 'package:ai_retouch/features/cartoon_ai/presentation/widget/cartoon_ai_widget.dart';
import 'package:ai_retouch/features/remove_wire/presentation/widget/remove_wire_widget.dart';
import 'package:ai_retouch/features/anime_ai/presentation/widget/anime_ai_widget.dart';
import 'package:ai_retouch/features/remove_text/presentation/widget/remove_text_widget.dart';
import 'package:ai_retouch/features/ai_filter/presentation/widget/ai_filter_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late InterstitialAdManager _interstitialAdManager;

  @override
  void initState() {
    super.initState();
    _interstitialAdManager = InterstitialAdManager(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-2475421127366450/2267516829'
            : 'ca-app-pub-3940256099942544/4411468910',
    );
    _interstitialAdManager.loadInterstitialAd();
  }

  @override
  void dispose(){
    _interstitialAdManager.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //ads
          // MyBannerAdWidget(),

          const AppNameWidget(),
          Positioned(
            top: 56.w,
            left: 235.w,
            child: const ProButtonWidget(),
          ),
          const SettingButtonWidget(),
          const Banner1Widget(),
          const EnhancePhotoWidget(),
          const RemoveObjectWidget(),
          const RemoveBackgroundWidget(),
          const TouchRemoveWidget(),
          const RestoreOldPictureWidget(),
          const CartoonAiWidget(),
          const RemoveWireWidget(),
          const AnimeAiWidget(),
          const RemoveTextWidget(),
          const AiFilterWidget(),
        ],
      ),
    );
  }
}
