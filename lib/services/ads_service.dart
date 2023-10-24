import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../config.dart';

abstract class AdsService {
  void loadInterstitialAds();

  void loadRewardedVideo();

  void show();

  void showRewarded();
}

class AdsServiceImpl extends AdsService {
  final int _maxFailedLoadAttempts = 10;

  int _numInterstitialLoadAttempts = 0;
  int _numRewardedlLoadAttempts = 0;

  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

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

  @override
  void loadRewardedVideo() {
    RewardedAd.load(
      adUnitId: AdConfig.rewardedAd,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          _rewardedAd = ad;
          _numRewardedlLoadAttempts = 0;
          _rewardedAd!.setImmersiveMode(true);
        },
        onAdFailedToLoad: (LoadAdError error) {
          Timer(const Duration(seconds: 5), () {
            _numRewardedlLoadAttempts += 1;
            _rewardedAd = null;

            if (_numRewardedlLoadAttempts < _maxFailedLoadAttempts) {
              loadRewardedVideo();
            }
          });
        },
      ),
    );
  }

  @override
  void showRewarded() {
    _rewardedAd?.show(onUserEarnedReward: (_, __) {});
  }
}
