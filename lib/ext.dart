import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';

extension ContextExt on BuildContext {
  showProgress() {
    OverlayLoadingProgress.start();
  }

  hideProgress() {
    OverlayLoadingProgress.stop();
  }
}
