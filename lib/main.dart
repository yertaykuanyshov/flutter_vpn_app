import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkan/bloc/vpn_bloc.dart';

import 'app.dart';

void main() {
  final VpnBloc vpnBloc = VpnBloc();

  runApp(
    BlocProvider(
      create: (BuildContext context) => vpnBloc,
      child: const VpnApp(),
    ),
  );
}
