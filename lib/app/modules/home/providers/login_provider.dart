import 'dart:convert';
import 'package:event_app/app/data/api_link.dart';
import 'package:event_app/app/modules/home/models/login_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends GetConnect {
  Future<LoginModel?> loginUser (String mobileNumber, String password) async {
    final String url =
        "${ApiLink.BASE_API_LINK}api/login";
    Map body = {
      "phone": mobileNumber,
      "password": password
    };

    final response = await http.post(Uri.parse(url),
        body: body,
        headers: {"Accept": "application/json"});

    print(response.body);
    print(mobileNumber);
    print(password);
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      String responseString = response.body;
      return LoginModel.fromJson(jsonDecode(responseString));
    } else {
      return null;
    }
  }
}
