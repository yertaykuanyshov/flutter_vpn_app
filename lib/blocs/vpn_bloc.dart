import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkan/services/vpn_service.dart';

enum VpnState {
  progress,
  connected,
  failedConnection,
  stopped,
}

class VpnBloc extends Cubit<VpnState> {
  VpnBloc(this._vpnService) : super(VpnState.stopped);

  final VpnService _vpnService;

  void connect() async {
    emit(VpnState.progress);

    await _vpnService.connect();

    emit(VpnState.connected);
  }

  void disconnect() async {
    emit(VpnState.progress);

    await Future.delayed(const Duration(seconds: 2));

    emit(VpnState.stopped);
  }
}
