import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kalkan/services/vpn_service.dart';
import 'package:logger/logger.dart';

import 'app.dart';
import 'blocs/vpn_bloc.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MobileAds.instance.initialize();

  await MobileAds.instance.updateRequestConfiguration(
    RequestConfiguration(
      testDeviceIds: [
        "FAA7CE61D7238E927C7421AD8C935215",
      ],
    ),
  );

  final vpnService = VpnServiceImpl();
  final vpnBloc = VpnBloc(vpnService);

  runApp(
    BlocProvider(
      create: (_) => vpnBloc,
      child: const VpnApp(),
    ),
  );
}
