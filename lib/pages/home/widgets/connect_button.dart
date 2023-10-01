import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../blocs/vpn_bloc.dart';

class ConnectButton extends StatelessWidget {
  const ConnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.blueAccent,
          elevation: 30,
          shadowColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(300),
          ),
          child: InkWell(
            onTap: () => context.read<VpnBloc>().connect(),
            child: const Icon(
              FontAwesomeIcons.powerOff,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
