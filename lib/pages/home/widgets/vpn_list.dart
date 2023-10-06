import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kalkan/blocs/vpn_bloc.dart';
import 'package:kalkan/models/vpn_server.dart';
import 'package:kalkan/pages/home/widgets/country_item.dart';

import '../../../blocs/vpn_list_bloc.dart';
import 'current_vpn_server.dart';

class VpnList extends StatelessWidget {
  const VpnList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<VpnListBloc>()..getServers(),
      builder: (_, state) {
        if (state is VpnListLoaded) {
          final servers = state.vpnServers;

          return Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 10,
              right: 10,
            ),
            child: TextButton(
              child: CurrentVpnServer(name: state.currentServer.name),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (_) {
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Country",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: servers.length,
                          shrinkWrap: true,
                          itemBuilder: (_, idx) {
                            return CountryItem(
                              vpnServer: servers[idx],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }

        return const LinearProgressIndicator();
      },
    );
  }
}
