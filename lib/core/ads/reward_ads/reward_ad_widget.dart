import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardAdWidget {
  static RewardedAd? _rewardedAd;

  static final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-3940256099942544/1712485313';

  static Future<bool> showRewardAd() async {
    final completer = Completer<bool>();

    if (_rewardedAd == null) {
      await _loadRewardAd();
    }

    if (_rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          debugPrint('User earned reward: ${reward.amount} ${reward.type}');
          completer.complete(true);
        },
      );
      _rewardedAd = null;
    } else {
      debugPrint('Ad not ready');
      completer.complete(false);
    }

    return completer.future;
  }

  static Future<void> _loadRewardAd() async {
    RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded');
          _rewardedAd = ad;

          // Gắn sự kiện khi quảng cáo kết thúc
          _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('Ad dismissed');
              ad.dispose();
              _loadRewardAd();
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
}
