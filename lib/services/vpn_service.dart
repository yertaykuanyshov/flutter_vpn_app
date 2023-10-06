import 'package:wireguard_vpn/wireguard_vpn.dart';

abstract class VpnService {
  Future<bool> connect();
}

class VpnServiceImpl extends VpnService {
  final vpn = WireguardVpn();

  @override
  Future<bool> connect() async {
    final params = SetStateParams(
      state: true,
      tunnel: Tunnel(
        privateKey: '',
        name: '',
        address: '',
        listenPort: '',
        dnsServer: '',
        peerAllowedIp: '',
        peerPublicKey: '',
        peerEndpoint: '',
        peerPresharedKey: '',
      ),
    );

    return await vpn.changeStateParams(params) ?? false;
  }
}
