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

    final isConnected = await _vpnService.connect();

    if (isConnected) {
      emit(VpnState.connected);
    } else {
      emit(VpnState.failedConnection);
    }
  }

  void disconnect() async {
    emit(VpnState.progress);

    await Future.delayed(const Duration(seconds: 2));

    emit(VpnState.stopped);
  }
}
