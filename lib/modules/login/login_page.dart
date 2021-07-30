import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User? user;
  Future<void> login() async {
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: "test@test.com", password: "123456");
      user = response.user;
      print(user);
    } catch (e) {
      print(e);
    }
  }

  Future<void> createAccount() async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "test4@test.com", password: "123456");
      final user = response.user;
      await FirebaseFirestore.instance
          .collection("/users")
          .doc(user!.uid)
          .set({"email": user.email, "created": FieldValue.serverTimestamp()});
      print(user);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> containsEmail(String email) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("/users")
          .where("email", isEqualTo: email)
          .where("created", isGreaterThanOrEqualTo: DateTime(2020, 7, 29))
          .get();
      return response.docs.length > 0;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> createTransaction() async {
    try {
      final response =
          await FirebaseFirestore.instance.collection("/transactions").add({
        "userId": user?.uid,
        "value": 1000,
        "type": "in",
        "createdAt": FieldValue.serverTimestamp()
      });
      return true;
    } catch (e) {
      throw e;
    }
  }

  Future<bool> transactionsByUser() async {
    try {
      final response = await FirebaseFirestore.instance
          .collection("/transactions")
          .where("userId", isEqualTo: user?.uid)
          .where("type", isEqualTo: "in")
          .get();
      print(response.docs.map((e) => e.data()));
      return true;
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    child: Text('Login'),
                    onPressed: () {
                      login();
                    }),
                TextButton(
                    child: Text('Criar Conta'),
                    onPressed: () {
                      createAccount();
                    }),
                TextButton(
                    child: Text('Verificar se existe o email'),
                    onPressed: () async {
                      print(await containsEmail("test3@test.com"));
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    child: Text('Criar transactions'),
                    onPressed: () {
                      createTransaction();
                    }),
                TextButton(
                    child: Text('Buscar transactions de um usuario'),
                    onPressed: () {
                      transactionsByUser();
                    }),
              ],
            ),
          ],
        )));
  }
}
