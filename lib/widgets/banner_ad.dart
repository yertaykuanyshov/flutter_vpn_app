import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kalkan/config.dart';
import 'package:kalkan/main.dart';

class BannerAdView extends StatefulWidget {
  const BannerAdView({super.key});

  @override
  State<BannerAdView> createState() => _BannerAdViewState();
}

class _BannerAdViewState extends State<BannerAdView> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: AdConfig.homePageBannerID,
      request: const AdRequest(),
      size: AdSize.fluid,
      listener: BannerAdListener(
        onAdFailedToLoad: (ad, error) {
          logger.e(error);
        },
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
      ),
    )..load();
  }

  @override
  void initState() {
    loadAd();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) {
        if (_isLoaded) {
          return SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          );
        }

        return const SizedBox();
      },
    );
  }
}
