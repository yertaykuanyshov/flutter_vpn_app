import 'package:wireguard_vpn/wireguard_vpn.dart';

abstract class VpnService {
  Future<void> connect();
}

class VpnServiceImpl extends VpnService {
  @override
  Future<void> connect() async {
    final wireguard = WireguardVpn();

    final results = await wireguard.changeStateParams(
      SetStateParams(
        state: false,
        tunnel: Tunnel(
          name: "Germany",
          address: "",
          dnsServer: "",
          listenPort: "",
          peerAllowedIp: "",
          peerEndpoint: "",
          peerPublicKey: "",
          privateKey: "",
          peerPresharedKey: "",
        ),
      ),
    );
  }
}
