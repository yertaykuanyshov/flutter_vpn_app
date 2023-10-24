import 'package:flutter/material.dart';
import 'package:kalkan/pages/home/home_page.dart';

class VpnApp extends StatelessWidget {
  const VpnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Colors.blue.withOpacity(0.03),
        ),
        colorScheme: const ColorScheme.light(
          primary: Colors.blue,
        ),
      ),
      home: const HomePage(),
    );
  }
}
