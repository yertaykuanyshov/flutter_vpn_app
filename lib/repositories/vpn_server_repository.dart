import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalkan/models/vpn_server.dart';

abstract class VpnServerRepository {
  Future<List<VpnServer>> getAllServers();

  void changeCurrentServer(VpnServer vpnServer);

  VpnServer getCurrentServer();
}

class VpnServerRepositoryImpl extends VpnServerRepository {
  VpnServer? _currentVpnServer;

  final List<VpnServer> _vpnServers = [];

  @override
  Future<List<VpnServer>> getAllServers() async {
    if (_vpnServers.isNotEmpty) {
      return _vpnServers;
    }

    final servers =
        await FirebaseFirestore.instance.collection("vpnServers").get();

    final vpnServers = servers.docs
        .map((e) => VpnServer.fromJson(e.data()))
        .where((vpn) => vpn.isAvailable == true)
        .toList();

    _vpnServers.addAll(vpnServers);

    return _vpnServers;
  }

  @override
  void changeCurrentServer(VpnServer vpnServer) {
    _currentVpnServer = vpnServer;
  }

  @override
  VpnServer getCurrentServer() {
    return _currentVpnServer ?? _vpnServers.firstWhere((e) => e.isFree == true);
  }
}
