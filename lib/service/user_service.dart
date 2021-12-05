import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:taxi/model/api_response.dart';
import 'package:taxi/model/environment.dart';
import 'package:taxi/model/user.dart';

class UserService {
  Future<APIResponse<bool>> signUp(User user) async {
    var API = Enviroment().API_URL + "/public-userapp-api/signup";
    print(API);
    return http.post(Uri.parse(API), body: user).then((data) {
      print(data.statusCode);
      if (data.statusCode == 200) {
        final result = json.decode(data.body);
        print(result);
      }
    }).catchError((onError) {
      return APIResponse<bool>(data: false, error: true);
    });
  }
}
