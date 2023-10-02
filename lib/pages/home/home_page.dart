import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalkan/pages/home/widgets/connect_button.dart';
import 'package:kalkan/pages/home/widgets/disconnect_button.dart';
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
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/map.png",
                  width: double.infinity,
                  opacity: const AlwaysStoppedAnimation(0.1),
                ),
              ),
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
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 10,
                  right: 10,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Germany",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        FontAwesomeIcons.chevronDown,
                        color: Colors.black,
                      ),
                    ],
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
