import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../blocs/vpn_bloc.dart';

class DisconnectButton extends StatelessWidget {
  const DisconnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 250,
        height: 250,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          color: Colors.white,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(300),
          ),
          child: InkWell(
            onTap: () => context.read<VpnBloc>().disconnect(),
            child: Icon(
              FontAwesomeIcons.powerOff,
              color: Theme.of(context).primaryColor,
              size: 80,
            ),
          ),
        ),
      ),
    );
  }
}
