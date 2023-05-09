import 'package:flutter_bloc/flutter_bloc.dart';

enum VpnState {
  connecting,
  connected,
  failedConnection,
  view,
}

class VpnBloc extends Cubit<VpnState> {
  VpnBloc() : super(VpnState.view);

  void connect() async {
    emit(VpnState.connecting);

    await Future.delayed(const Duration(seconds: 2));

    emit(VpnState.connected);
  }
}
