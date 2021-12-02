import 'package:event_app/app/modules/notification/models/notification_model.dart';
import 'package:event_app/app/modules/notification/providers/notification_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationController extends GetxController {

  final isLoading = false.obs;
  final status = ''.obs;
  final token = ''.obs;
  final localStorage = GetStorage();
  final notificationList = <Notification>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserToken();
    await getAllNotification();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getUserToken() {
    token.value = localStorage.read('token');
    update();
  }

  getAllNotification() async {
    try {
      isLoading(true);
      var notifications =
      await NotificationProvider().getNotification(token.value);
      if (notifications != null) {
        status.value = notifications.success.toString();
        update();
        if (status.value == "true") {
          notificationList.clear();
          if(notifications.data!.isNotEmpty){
            notificationList.addAll(notifications.data!);
            print(notificationList);
            update();
          }
        }
      } else {}
    } finally {
      isLoading(false);
      update();
    }
  }

}
