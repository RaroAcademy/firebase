import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getTransactions() async {
    try {
      //REALTIME
      FirebaseFirestore.instance
          .collection("/transactions")
          .snapshots()
          .listen((event) {
        print("Received event: ${event.docs.map((e) => e.data())}");
      });

      //CREATE
      await FirebaseFirestore.instance
          .collection("/transacations")
          .add({"type": "expense"});

      //UPDATE
      await FirebaseFirestore.instance
          .collection("/transactions")
          .doc("wJMcL94jEPjs6cQd1JuA")
          .set({"value": 400}, SetOptions(merge: true));

      //DELETE
      await FirebaseFirestore.instance
          .collection("/transactions")
          .doc("wJMcL94jEPjs6cQd1JuA")
          .delete();

      //READ
      final response =
          await FirebaseFirestore.instance.collection("/transactions").get();
      print(response.docs.map((e) => e.data()).toList());
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getTransactions,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
