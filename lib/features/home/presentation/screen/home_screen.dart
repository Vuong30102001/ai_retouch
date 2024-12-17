import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../core/ads/my_banner_ad_widget.dart';
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
  InterstitialAd? _interstitialAd;
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/4411468910';

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: adUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad){},
            onAdImpression: (ad){},
            onAdFailedToShowFullScreenContent: (ad, error){
              ad.dispose();
            },
            onAdDismissedFullScreenContent: (ad) {
              // Dispose the ad here to free resources.
              ad.dispose();
            },
              onAdClicked: (ad) {},
          );
          debugPrint('$ad loaded.');
          _interstitialAd = ad;
          _showInterstitialAd();
        },
        onAdFailedToLoad: (error) {
          print('Failed to load an interstitial ad: ${error.message}');
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
    } else {
      print('Interstitial ad is not ready.');
    }
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
