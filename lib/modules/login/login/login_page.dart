import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/app_controller.dart';
import 'package:firebase/modules/login/login/login_controller.dart';
import 'package:firebase/modules/login/login_repository.dart';
import 'package:firebase/shared/auth/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController(
    repository: AppController().repoConfiguration == "Firebase"
        ? LoginRepositoryImpl()
        : LoginRepositoryImplApi(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.purple),
                hintStyle: TextStyle(color: Colors.purple),
                errorStyle: TextStyle(color: Colors.purple),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    child: Text('Login'),
                    onPressed: () {
                      controller.login(
                        email: "test@test.com",
                        password: "123456",
                      );
                    }),
                TextButton(
                    child: Text('Criar Conta'),
                    onPressed: () {
                      // controller.createAccount();
                    }),
                TextButton(
                    child: Text('Verificar se existe o email'),
                    onPressed: () async {
                      // print(await containsEmail("test3@test.com"));
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    child: Text('Criar transactions'),
                    onPressed: () {
                      // createTransaction();
                    }),
                TextButton(
                    child: Text('Buscar transactions de um usuario'),
                    onPressed: () {
                      // transactionsByUser();
                    }),
              ],
            ),
          ],
        )));
  }
}
