import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalkan/ext.dart';
import '../blocs/vpn_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pontiaca VPN",
          style: GoogleFonts.ubuntu(
            color: Colors.black,
            fontSize: 30,
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
        buildWhen: (_, state) =>
            state == VpnState.connected || state == VpnState.stopped,
        builder: (BuildContext context, state) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset(
                  "assets/map.png",
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => context.read<VpnBloc>().connect(),
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(200),
                          border: Border.all(
                            width: 14,
                            color: Colors.greenAccent,
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
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          context.read<VpnBloc>().stop(),
                                      child: const Text("Stop"),
                                    ),
                                  ],
                                );
                              }

                              return const Text(
                                "GO",
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.greenAccent,
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
              Positioned(
                bottom: 30,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/1200px-Flag_of_Germany.svg.png",
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Germany",
                      style: GoogleFonts.ubuntu(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black26,
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
