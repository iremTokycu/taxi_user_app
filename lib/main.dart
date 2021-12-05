import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:taxi/service/user_service.dart';

import 'intro.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => UserService());
}

void main() {
  setupLocator();
  runApp(new MaterialApp(
    home: new SplashScreenPage(),
  ));
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => new _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new IntroScreen(),
        title: new Text(
          "Cici Taksi'ye \nHoşgeldiniz!",
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        image: Image.asset(
          'assets/images/taksi_1000x2000_arkaseffaf.png',
        ),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 200.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}
