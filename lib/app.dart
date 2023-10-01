import 'package:flutter/material.dart';
import 'package:kalkan/pages/home/home_page.dart';

class VpnApp extends StatelessWidget {
  const VpnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
