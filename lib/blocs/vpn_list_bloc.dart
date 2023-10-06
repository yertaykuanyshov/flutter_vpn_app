import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkan/repositories/vpn_server_repository.dart';

import '../models/vpn_server.dart';

abstract class VpnListState {}

class VpnListLoaded extends VpnListState {
  VpnListLoaded(this.vpnServers);

  final List<VpnServer> vpnServers;
}

class Loading extends VpnListState {}

class VpnListBloc extends Cubit<VpnListState> {
  VpnListBloc(this._vpnServerRepository) : super(Loading());

  final VpnServerRepository _vpnServerRepository;

  void getServers() async {
    final vpnServers = await _vpnServerRepository.getAllServers();

    emit(VpnListLoaded(vpnServers));
  }
}
