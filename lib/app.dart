import 'package:flutter/material.dart';
import 'package:kalkan/pages/home_page.dart';
import 'package:overlay_kit/overlay_kit.dart';

class VpnApp extends StatelessWidget {
  const VpnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlayKit(
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
