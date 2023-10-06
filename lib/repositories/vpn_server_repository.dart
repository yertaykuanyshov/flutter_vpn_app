import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalkan/models/vpn_server.dart';

abstract class VpnServerRepository {
  Future<List<VpnServer>> getAllServers();
}

class VpnServerRepositoryImpl extends VpnServerRepository {
  final List<VpnServer> _vpnServers = [];

  @override
  Future<List<VpnServer>> getAllServers() async {
    if (_vpnServers.isNotEmpty) {
      return _vpnServers;
    }

    final servers =
        await FirebaseFirestore.instance.collection("vpnServers").get();

    _vpnServers
        .addAll(servers.docs.map((e) => VpnServer.fromJson(e.data())).toList());

    return _vpnServers;
  }
}
