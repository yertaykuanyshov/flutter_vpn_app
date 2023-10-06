import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalkan/models/vpn_server.dart';

import '../../../blocs/vpn_list_bloc.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({
    super.key,
    required this.vpnServer,
  });

  final VpnServer vpnServer;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: CachedNetworkImageProvider(
              vpnServer.flagUrl,
            ),
          ),
        ),
      ),
      title: Text(vpnServer.name),
      trailing: vpnServer.isFree
          ? null
          : const Icon(
              FontAwesomeIcons.solidStar,
              color: Colors.orange,
            ),
      onTap: () {
        if (vpnServer.isFree) {
          context.read<VpnListBloc>().changeServer(vpnServer);
          Navigator.of(context).pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("This server Premium"),
              duration: const Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.orange,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 100,
                right: 20,
                left: 20,
              ),
            ),
          );
        }
      },
    );
  }
}
