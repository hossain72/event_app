import 'package:event_app/app/modules/home/providers/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final hidePassword = true.obs;
  final confirmHidPassword = true.obs;
  final localStorage = GetStorage();
  final isLoading = false.obs;
  final status = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print(localStorage.read('token'));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  passwordHide() {
    hidePassword.value = !hidePassword.value;
    update();
  }

  loginUser(String mobileNumber, String password) async {
    try {
      isLoading(true);
      var login =
      await LoginProvider().loginUser(mobileNumber, password);
      if (login != null) {
        status.value = login.success.toString();
        update();
        if (status.value == "true") {
          localStorage.write('token', login.data!.accessToken);
          localStorage.write('isLogged', true);
          Get.offAllNamed('/notification');
        } else {}
      } else {}
    } finally {
      isLoading(false);
      update();
    }
  }


}
