import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kalkan/main.dart';

import '../config.dart';

abstract class AdsService {
  void loadInterstitialAds();

  void show();
}

class AdsServiceImpl extends AdsService {
  int _numInterstitialLoadAttempts = 0;
  final int _maxFailedLoadAttempts = 10;

  InterstitialAd? _interstitialAd;

  @override
  void loadInterstitialAds() {
    InterstitialAd.load(
      adUnitId: AdConfig.interstitialAd,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _interstitialAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          Timer(const Duration(seconds: 5), () {
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;

            if (_numInterstitialLoadAttempts < _maxFailedLoadAttempts) {
              loadInterstitialAds();
            }
          });
        },
      ),
    );
  }

  @override
  void show() {
    _interstitialAd?.show();
  }
}
