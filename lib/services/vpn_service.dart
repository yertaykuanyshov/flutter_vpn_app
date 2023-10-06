import 'dart:convert';

import 'package:kalkan/main.dart';
import 'package:kalkan/models/vpn_server.dart';
import 'package:wireguard_vpn/wireguard_vpn.dart';

abstract class VpnService {
  Future<bool> connect(VpnServer vpnServer);

  Future<bool> disconnect();

  Tunnel getTunnel(String data);
}

class VpnServiceImpl extends VpnService {
  final vpn = WireguardVpn();

  Tunnel? _currentTunnel;

  @override
  Future<bool> connect(VpnServer vpnServer) async {
    try {
      _currentTunnel = getTunnel(vpnServer.config);

      logger.w(_currentTunnel!.toJson());

      return await changeState(true);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> disconnect() async {
    return await changeState(false);
  }

  Future<bool> changeState(bool isActive) async {
    final params = SetStateParams(
      state: isActive,
      tunnel: _currentTunnel!,
    );

    return await vpn.changeStateParams(params) ?? false;
  }

  @override
  Tunnel getTunnel(String data) {
    final decodedData = utf8.decode(base64.decode(data));

    final config = decodedData.split("\n");

    final privateKey = config
        .firstWhere((e) => e.contains("PrivateKey"))
        .split("PrivateKey = ")[1];
    final address =
        config.firstWhere((e) => e.contains("Address")).split("Address = ")[1];

    final dns = config.firstWhere((e) => e.contains("DNS")).split("DNS = ")[1];
    final publicKey = config
        .firstWhere((e) => e.contains("PublicKey"))
        .split("PublicKey = ")[1];
    final presharedKey = config
        .firstWhere((e) => e.contains("PresharedKey"))
        .split("PresharedKey = ")[1];
    final endpoint = config
        .firstWhere((e) => e.contains("Endpoint"))
        .split("Endpoint = ")[1];

    final listenPort = endpoint.split(":")[1];

    final allowedIPs = config
        .firstWhere((e) => e.contains("AllowedIPs"))
        .split("AllowedIPs = ")[1];

    return Tunnel(
      name: "Germany",
      address: address,
      listenPort: listenPort,
      dnsServer: dns,
      privateKey: privateKey,
      peerAllowedIp: allowedIPs,
      peerPublicKey: publicKey,
      peerEndpoint: endpoint,
      peerPresharedKey: presharedKey,
    );
  }
}
