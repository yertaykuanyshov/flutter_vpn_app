import 'package:kalkan/main.dart';
import 'package:wireguard_vpn/wireguard_vpn.dart';

abstract class VpnService {
  Future<void> connect();
}

class VpnServiceImpl extends VpnService {
  final vpn = WireguardVpn();

  @override
  Future<void> connect() async {
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

    await vpn.changeStateParams(params).then((value) => logger.w(value));
  }
}
