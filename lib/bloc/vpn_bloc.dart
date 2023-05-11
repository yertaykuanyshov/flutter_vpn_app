import 'package:flutter_bloc/flutter_bloc.dart';

enum VpnState {
  progress,
  connected,
  failedConnection,
  stopped,
}

class VpnBloc extends Cubit<VpnState> {
  VpnBloc() : super(VpnState.stopped);

  void connect() async {
    emit(VpnState.progress);

    await Future.delayed(const Duration(seconds: 2));

    emit(VpnState.connected);
  }

  void stop() async {
    emit(VpnState.progress);

    await Future.delayed(const Duration(seconds: 2));

    emit(VpnState.stopped);
  }
}
