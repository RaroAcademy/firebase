import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/app_controller.dart';
import 'package:firebase/shared/auth/auth_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    AuthController.instance.init();
    getConfiguration();
    super.initState();
  }

  Future<void> getConfiguration() async {
    final controller = AppController();

    final response = await FirebaseFirestore.instance
        .collection("/configuration")
        .doc("repository")
        .get();

    ///valores aceitaveis  :
    //! "api"
    //! "firebase"
    controller.repoConfiguration = response.data()!["repoConfiguration"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Page"),
      ),
    );
  }
}
