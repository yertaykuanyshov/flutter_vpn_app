import 'package:firebase_analytics/firebase_analytics.dart';

abstract class AnalyticService {
  Future<void> onVpnConnect();
}

class AnalyticServiceImpl extends AnalyticService {
  FirebaseAnalytics get _analytics => FirebaseAnalytics.instance;

  @override
  Future<void> onVpnConnect() async {
    _analytics.logEvent(name: "onVpnConnect");
  }
}
