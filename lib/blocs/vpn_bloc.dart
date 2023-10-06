import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkan/repositories/vpn_server_repository.dart';
import 'package:kalkan/services/vpn_service.dart';

enum VpnState {
  progress,
  connected,
  failedConnection,
  stopped,
}

class VpnBloc extends Cubit<VpnState> {
  VpnBloc(
    this._vpnService,
    this._vpnServerRepository,
  ) : super(VpnState.stopped);

  final VpnService _vpnService;
  final VpnServerRepository _vpnServerRepository;

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
    emit(VpnState.stopped);
  }
}
