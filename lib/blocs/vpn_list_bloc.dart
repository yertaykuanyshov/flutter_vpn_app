import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkan/blocs/vpn_bloc.dart';
import 'package:kalkan/repositories/vpn_server_repository.dart';

import '../models/vpn_server.dart';

abstract class VpnListState {}

class VpnListLoaded extends VpnListState {
  VpnListLoaded(this.vpnServers, this.currentServer);

  final List<VpnServer> vpnServers;
  final VpnServer currentServer;
}

class Loading extends VpnListState {}

class VpnListBloc extends Cubit<VpnListState> {
  VpnListBloc(this._vpnServerRepository, this._vpnBloc) : super(Loading());

  final VpnServerRepository _vpnServerRepository;
  final VpnBloc _vpnBloc;

  void changeServer(VpnServer vpnServer) async {
    _vpnBloc.disconnect();

    _vpnServerRepository.changeCurrentServer(vpnServer);

    getServers();
  }

  Future<void> getServers() async {
    final vpnServers = await _vpnServerRepository.getAllServers();
    final currentVpnServer = _vpnServerRepository.getCurrentServer();

    emit(VpnListLoaded(vpnServers, currentVpnServer));
  }
}
