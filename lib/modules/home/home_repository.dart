// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/shared/auth/auth_controller.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class HomeRepository {
//   Future<bool> containsEmail(String email) async {
//     try {
//       final response = await FirebaseFirestore.instance
//           .collection("/users")
//           .where("email", isEqualTo: email)
//           .where("created", isGreaterThanOrEqualTo: DateTime(2020, 7, 29))
//           .get();
//       return response.docs.length > 0;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<bool> containsEmail(String email) async {
//     try {
//       final response = await FirebaseFirestore.instance
//           .collection("/users")
//           .where("email", isEqualTo: email)
//           .where("created", isGreaterThanOrEqualTo: DateTime(2020, 7, 29))
//           .get();
//       return response.docs.length > 0;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<bool> createTransaction() async {
//     try {
//       final response =
//           await FirebaseFirestore.instance.collection("/transactions").add({
//         "userId": user?.uid,
//         "value": 1000,
//         "type": "in",
//         "createdAt": FieldValue.serverTimestamp(),
//       });
//       return true;
//     } catch (e) {
//       throw e;
//     }
//   }

//   Future<bool> transactionsByUser() async {
//     try {
//       final response = await FirebaseFirestore.instance
//           .collection("/transactions")
//           .where("userId", isEqualTo: user?.uid)
//           .where("type", isEqualTo: "in")
//           .get();
//       print(response.docs.map((e) => e.data()));
//       return true;
//     } catch (e) {
//       throw e;
//     }
//   }
// }
