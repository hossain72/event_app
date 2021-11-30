import 'dart:convert';
import 'package:event_app/app/data/api_link.dart';
import 'package:event_app/app/modules/registration/models/registration_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegistrationProvider extends GetConnect {
  Future<RegistrationModel?> createUser(String name, String mobileNumber, String password) async {
    final String url =
        "${ApiLink.BASE_API_LINK}api/register";
    Map body = {
      "name": name,
      "password": password,
      "phone": mobileNumber
    };

    final response = await http.post(Uri.parse(url),
        body: body,
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200 || response.statusCode == 201) {
      String responseString = response.body;
      return RegistrationModel.fromJson(jsonDecode(responseString));
    } else {
      return null;
    }
  }
}
