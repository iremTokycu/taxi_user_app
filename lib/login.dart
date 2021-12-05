import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi/service/user_service.dart';

import 'konum.dart';
import 'model/user.dart';

void main() {
  runApp(new MaterialApp(
    home: new LoginPage(),
  ));
}

const users = {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  UserService get userService => GetIt.I<UserService>();
  Duration get loginTime => const Duration(milliseconds: 2250);
  User user = new User();

  Future<String> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');

    user.mail = data.name;
    user.password = data.password;

    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "null";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Taxi Driver',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        final userResponse = userService.signUp(user);

        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const MapScreen(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
