import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalkan/pages/home/widgets/connect_button.dart';
import 'package:kalkan/pages/home/widgets/disconnect_button.dart';
import '../../blocs/vpn_bloc.dart';

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
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/map.png",
                  width: double.infinity,
                  opacity: const AlwaysStoppedAnimation(0.1),
                ),
              ),
              state == VpnState.connected
                  ? const DisconnectButton()
                  : const ConnectButton(),
            ],
          );
        },
      ),
    );
  }
}
