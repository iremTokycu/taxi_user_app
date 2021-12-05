import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taxi/model/api_response.dart';
import 'package:taxi/model/environment.dart';
import 'package:taxi/model/user.dart';

class UserService {
  Future<APIResponse<bool>> signUp(User user) async {
    var API = Enviroment().API_URL + "/public-userapp-api/signup";
    print(API);
    // ignore: missing_return
    return http
        .post(Uri.parse(API),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              'password': user.password,
              'mail': user.mail
              // ignore: missing_return
            }))
        // ignore: missing_return
        .then((data) {
      if (data.statusCode == 200) {
        final result = json.decode(data.body);
        return APIResponse<bool>(data: result, error: true);
      }
    });
  }

  Future<APIResponse<User>> login(User user) async {
    var API = Enviroment().API_URL + "/public-userapp-api/login";
    print(API);
    // ignore: missing_return
    return http
        .post(Uri.parse(API),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              'password': user.password,
              'mail': user.mail
              // ignore: missing_return
            }))
        // ignore: missing_return
        .then((data) {
      if (data.statusCode == 200 && data.body != "") {
        final result = json.decode(data.body);

        User user = new User(
            mail: result['mail'],
            password: result['password'],
            valid: result['valid']);

        return APIResponse<User>(data: user);
      }
      return APIResponse<User>(error: true);
    });
  }
}
