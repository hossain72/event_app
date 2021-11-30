import 'dart:convert';
import 'package:event_app/app/data/api_link.dart';
import 'package:event_app/app/modules/notification/models/notification_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NotificationProvider extends GetConnect {
  Future<NotificationModel?> getNotification(String token) async {
    final String url =
        "${ApiLink.BASE_API_LINK}api/notification";


    final response = await http.get(Uri.parse(url),
        headers: {"Accept": "application/json", "Authorization" : "Bearer $token"});

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      String responseString = response.body;
      return NotificationModel.fromJson(jsonDecode(responseString));
    } else {
      return null;
    }
  }
}
