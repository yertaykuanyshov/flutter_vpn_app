import 'package:flutter/material.dart';

class BgMapImage extends StatelessWidget {
  const BgMapImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Image.asset(
        "assets/map.png",
        width: double.infinity,
        opacity: const AlwaysStoppedAnimation(0.1),
      ),
    );
  }
}
