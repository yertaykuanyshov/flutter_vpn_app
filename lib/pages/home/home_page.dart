import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkan/pages/home/widgets/bg_map_image.dart';
import 'package:kalkan/pages/home/widgets/connect_button.dart';
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
      body: BlocConsumer(
        bloc: context.read<VpnBloc>(),
        listener: (_, state) {
          if (state == VpnState.failedConnection) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Failed connection"),
                duration: Duration(seconds: 2),
              ),
            );
          }
        },
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
              const VpnList(),
            ],
          );
        },
      ),
    );
  }
}
