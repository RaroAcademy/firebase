import 'package:firebase/modules/login/login_repository.dart';
import 'package:firebase/shared/models/user_data.dart';

class LoginController {
  final LoginRepository repository;

  late UserData user;

  LoginController({
    required this.repository,
  });

  Future<bool> login({
    required String password,
    required String email,
  }) async {
    //update(LoginStateSuccess);
    //appStatus = AppStatus.loading;

    final response = await repository.login(
      email: email,
      password: password,
    );

    user = response!;

    //update(LoginStatusSuccess);
    // appStatus = AppStatus.success;
    return true;
  }
}
