import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardAdWidget extends StatefulWidget {
  const RewardAdWidget({super.key});

  @override
  State<RewardAdWidget> createState() => _RewardAdWidgetState();
}

class _RewardAdWidgetState extends State<RewardAdWidget> {
  RewardedAd? _rewardedAd;

  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-3940256099942544/1712485313';

  int userPoints = 0;

  @override
  void initState() {
    super.initState();
    _loadRewardAd();
  }

  void _loadRewardAd() {
    RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded');
          _rewardedAd = ad;
          _showRewardAd();

          // Gắn sự kiện khi người dùng nhận thưởng
          _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('Ad dismissed');
              ad.dispose(); // Giải phóng quảng cáo khi đã xong
              _loadRewardAd(); // Tải lại quảng cáo
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('Failed to show ad: $error');
              ad.dispose();
              _loadRewardAd();
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('RewardAd failed to load: $error');
        },
      ),
    );
  }

  void _showRewardAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          userPoints += reward.amount.toInt();
          debugPrint('User earned reward: ${reward.amount} ${reward.type}');
        },
      );
      _rewardedAd = null;
    } else {
      debugPrint('Ad not ready');
    }
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
