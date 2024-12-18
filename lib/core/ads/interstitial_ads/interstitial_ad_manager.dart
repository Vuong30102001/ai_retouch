import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdManager{
  InterstitialAd? _interstitialAd;
  final String adUnitId;

  InterstitialAdManager({required this.adUnitId});

  void loadInterstitialAd(){
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad){
              ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdShowedFullScreenContent: (ad) {},
                onAdImpression: (ad) {},
                onAdFailedToShowFullScreenContent: (ad, error) {
                  ad.dispose();
                },
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                },
                onAdClicked: (ad) {},
              );
              _interstitialAd = ad;
              showInterstitialAd();
            },
            onAdFailedToLoad: (error){
              print('Failed to load an interstitial ad: ${error.message}');
            }
        )
    );
  }

  void showInterstitialAd(){
    if(_interstitialAd != null){
      _interstitialAd!.show();
    }
    else
      {
        print('InterstitialAd not exist');
      }
  }

  void dispose(){
    _interstitialAd?.dispose();
  }
}