import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get_it/get_it.dart';
import 'package:taxi/konum.dart';
import 'package:taxi/model/api_response.dart';
import 'package:taxi/service/user_service.dart';

import 'model/user.dart';

void main() {
  runApp(new MaterialApp(
    home: new LoginPage(),
  ));
}

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginPageWidget();
  }
}

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  UserService get userService => GetIt.I<UserService>();

  Duration get loginTime => const Duration(milliseconds: 2250);
  User user = new User();
  bool isValid = false;

  Future<String> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      user.mail = data.name;
      user.password = data.password;

      Future<APIResponse<User>> loginUserResponse = userService.login(user);
      loginUserResponse.then((value) => {
            if (value.error)
              {print("kullanici yok")}
            else
              {
                setState(() {
                  isValid = true;
                })
              }
          });

      return null;
    });
  }

  Future<String> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');

    user.mail = data.name;
    user.password = data.password;
    final userResponse = userService.signUp(user);
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      return "null";
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Welcome',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        if (isValid) {
          Route route = MaterialPageRoute(builder: (context) {
            return MapScreen();
          });
          Navigator.push(context, route);
        }
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
