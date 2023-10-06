import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kalkan/models/vpn_server.dart';

abstract class VpnServerRepository {
  Future<List<VpnServer>> getAllServers();
}

class VpnServerRepositoryImpl extends VpnServerRepository {
  @override
  Future<List<VpnServer>> getAllServers() async {
    final servers =
        await FirebaseFirestore.instance.collection("vpnServers").get();

    return servers.docs.map((e) => VpnServer.fromJson(e.data())).toList();
  }
}
