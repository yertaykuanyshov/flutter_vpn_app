import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkan/services/vpn_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test("test getTunnel config from string", () async {
    final vpnService = VpnServiceImpl();
    final testData = await rootBundle.loadString("assets/vpn_server_test.conf");

    final tunnel = vpnService.getTunnel(testData);

    expect(tunnel.address, "10.66.66.213/24");
    expect(tunnel.privateKey, "UFU3iP6MhDA0R+O8cNHtz/m45y+hJMDflZAR1srRbmA=");
    expect(tunnel.dnsServer, "176.103.130.130,176.103.130.131");
    expect(
        tunnel.peerPublicKey, "Bf34heokqDOce9x1kNFGpEm1jJ6lhcsv63/7dijwER0=");
    expect(tunnel.peerPresharedKey,
        "eKgJ1X1a99+rpg+HLWYXejqa6uNVhqy33jNgXuY8Kfs=");
    expect(tunnel.peerEndpoint, "ho1one.09vpn.com:7070");
    expect(tunnel.peerAllowedIp, "0.0.0.0/0,::/0");
  });
}
