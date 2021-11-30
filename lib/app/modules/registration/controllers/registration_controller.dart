import 'package:event_app/app/modules/registration/providers/registration_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RegistrationController extends GetxController {
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final hidePassword = true.obs;
  final confirmHidPassword = true.obs;
  final isLoading = false.obs;
  final status = ''.obs;
  final localStorage = GetStorage();

  @override
  void onClose() {}

  passwordHide() {
    hidePassword.value = !hidePassword.value;
    update();
  }

  confirmPasswordHide() {
    confirmHidPassword.value = !confirmHidPassword.value;
    update();
  }

  createUserAccount(String name, String mobileNumber, String password) async {
    try {
      isLoading(true);
      var registration =
          await RegistrationProvider().createUser(name, mobileNumber, password);
      if (registration != null) {
        status.value = registration.success.toString();
        update();
        if (status.value == "true") {
          localStorage.write('token', registration.data!.accessToken);
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
