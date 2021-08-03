import 'package:firebase/modules/home/home_page.dart';
import 'package:firebase/modules/login/login/login_page.dart';
import 'package:firebase/modules/splash/splash_page.dart';
import 'package:firebase/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AuthController.instance.navigatorKey,
      title: 'Flutterlistener Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (_) => SplashPage(),
        "/login": (_) => LoginPage(),
        "/home": (_) => HomePage()
      },
    );
  }
}
