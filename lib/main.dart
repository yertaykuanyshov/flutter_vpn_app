import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkan/services/vpn_service.dart';

import 'app.dart';
import 'blocs/vpn_bloc.dart';

void main() {
  final vpnService = VpnServiceImpl();
  final vpnBloc = VpnBloc(vpnService);

  runApp(
    BlocProvider(
      create: (_) => vpnBloc,
      child: const VpnApp(),
    ),
  );
}
