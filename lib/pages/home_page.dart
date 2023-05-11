import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkan/bloc/vpn_bloc.dart';
import 'package:kalkan/ext.dart';

import '../config.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Fenix VPN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer(
        bloc: context.read<VpnBloc>(),
        listener: (_, state) {
          if (state == VpnState.progress) {
            context.showProgress();
          } else {
            context.hideProgress();
          }
        },
        buildWhen: (_, state) => state == VpnState.connected || state == VpnState.stopped,
        builder: (BuildContext context, state) {
          return Stack(
            children: [
              Image.network(
                "https://cdn.pixabay.com/photo/2014/03/25/16/34/world-map-297446_1280.png",
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context.read<VpnBloc>().connect(),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          border: Border.all(
                            width: 10,
                            color: greenColor,
                          ),
                        ),
                        child: Center(
                          child: Builder(
                            builder: (context) {
                              if (state == VpnState.connected) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Connected",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: greenColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => context.read<VpnBloc>().stop(),
                                      child: const Text("Stop"),
                                    ),
                                  ],
                                );
                              }

                              return const Text(
                                "GO",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: greenColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                bottom: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/1200px-Flag_of_Germany.svg.png",
                      width: 50,
                      height: 30,
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      "Germany",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
