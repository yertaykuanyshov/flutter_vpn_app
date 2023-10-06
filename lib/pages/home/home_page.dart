import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalkan/pages/home/widgets/bg_map_image.dart';
import 'package:kalkan/pages/home/widgets/connect_button.dart';
import 'package:kalkan/pages/home/widgets/current_vpn_server.dart';
import 'package:kalkan/pages/home/widgets/disconnect_button.dart';
import 'package:kalkan/pages/home/widgets/vpn_list.dart';
import '../../blocs/vpn_bloc.dart';
import '../../widgets/banner_ad.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pontiaca VPN",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder(
        bloc: context.read<VpnBloc>(),
        builder: (BuildContext context, state) {
          return Column(
            children: [
              const BgMapImage(),
              Builder(
                builder: (_) {
                  if (state == VpnState.connected) {
                    return const DisconnectButton();
                  }

                  return ConnectButton(
                    isConnecting: state == VpnState.progress,
                  );
                },
              ),
              const Expanded(child: SizedBox()),
              const BannerAdView(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                child: TextButton(
                  child: const CurrentVpnServer(name: ''),
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return const VpnList();
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
