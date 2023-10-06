import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/vpn_list_bloc.dart';

class VpnList extends StatelessWidget {
  const VpnList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<VpnListBloc>()..getServers(),
      builder: (_, state) {
        if (state is VpnListLoaded) {
          return ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (_, idx) {
              return const ListTile(
                leading: Icon(Icons.flag),
                title: Text("France"),
              );
            },
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
