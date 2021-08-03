import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/shared/auth/auth_controller.dart';
import 'package:firebase/shared/models/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepository {
  Future<UserData?> login({required String email, required String password});
  Future<void> createAccount({
    required UserData user,
    required String password,
  });
  Future<bool>? recoveryPassword({required String email});
}

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<UserData?> login(
      {required String email, required String password}) async {
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AuthController.instance.loginUser(response.user!);

      final getUser = await FirebaseFirestore.instance
          .collection("/users")
          .doc(response.user!.uid)
          .get();
      if (getUser.data() != null) {
        return UserData.fromMap(getUser.data()!);
      } else {
        throw "Usuário não encontrado";
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

//"test4@test.com"
//"123456"
  @override
  Future<void> createAccount({
    required UserData user,
    required String password,
  }) async {
    try {
      final response =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );
      final _user = response.user;

      Map<String, dynamic> _userMap = user.toMap();

      await FirebaseFirestore.instance
          .collection("/users")
          .doc(_user!.uid)
          .set(_userMap);
      print(user);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<bool>? recoveryPassword({required String email}) {}
}

class LoginRepositoryImplApi extends LoginRepository {
  @override
  Future<void> createAccount(
      {required UserData user, required String password}) {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  Future<UserData?> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool>? recoveryPassword({required String email}) {
    // TODO: implement recoveryPassword
    throw UnimplementedError();
  }
}
