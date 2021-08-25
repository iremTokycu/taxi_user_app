import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'SplashScreen.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTaxi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: SplashScreenPage(),
    );
  }
}
