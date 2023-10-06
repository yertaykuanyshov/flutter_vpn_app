import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kalkan/repositories/vpn_server_repository.dart';
import 'package:kalkan/services/vpn_service.dart';
import 'package:logger/logger.dart';

import 'app.dart';
import 'blocs/vpn_bloc.dart';
import 'blocs/vpn_list_bloc.dart';
import 'firebase_options.dart';

final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await MobileAds.instance.initialize();
  await MobileAds.instance.updateRequestConfiguration(
    RequestConfiguration(testDeviceIds: ["FAA7CE61D7238E927C7421AD8C935215"]),
  );

  final vpnService = VpnServiceImpl();
  final vpnListRepository = VpnServerRepositoryImpl();
  final vpnBloc = VpnBloc(vpnService, vpnListRepository);
  final vpnListBloc = VpnListBloc(vpnListRepository, vpnBloc);

  await Future.wait([
    vpnListBloc.getServers(),
  ]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => vpnBloc),
        BlocProvider(create: (_) => vpnListBloc),
      ],
      child: const VpnApp(),
    ),
  );
}
