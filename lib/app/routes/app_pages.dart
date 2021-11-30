import 'package:get/get.dart';

import 'package:event_app/app/modules/home/bindings/home_binding.dart';
import 'package:event_app/app/modules/home/views/home_view.dart';
import 'package:event_app/app/modules/notification/bindings/notification_binding.dart';
import 'package:event_app/app/modules/notification/views/notification_view.dart';
import 'package:event_app/app/modules/notificationDetails/bindings/notification_details_binding.dart';
import 'package:event_app/app/modules/notificationDetails/views/notification_details_view.dart';
import 'package:event_app/app/modules/registration/bindings/registration_binding.dart';
import 'package:event_app/app/modules/registration/views/registration_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_DETAILS,
      page: () => NotificationDetailsView(),
      binding: NotificationDetailsBinding(),
    ),
  ];
}
