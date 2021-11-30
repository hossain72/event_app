import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {

  @override
  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        centerTitle: true,
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
/*        padding: EdgeInsets.only(
            left: height / 50, right: height / 50, top: height / 50, bottom: height/50),*/
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.notificationList.length,
            padding: EdgeInsets.all(height / 50),
            itemBuilder: (_, index) {
              return Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed('/notification-details', arguments: controller.notificationList[index]),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(229, 229, 229, 1),
                          borderRadius: BorderRadius.circular(6)),
                      child: Row(
                        children: [
                          Container(
                            height: height / 7,
                            width: width / 3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/event_img.png'),
                                    fit: BoxFit.fill)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: height / 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height / 100,
                                ),
                                Text(
                                  controller.notificationList[index].title.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      color: Color.fromRGBO(55, 71, 79, 1),
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ),
                                SizedBox(
                                  height: height / 100,
                                ),
                                Text(
                                  controller.notificationList[index].body.toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      color: Color.fromRGBO(55, 71, 79, 0.72),
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 100,
                  )
                ],
              );
            }),
      ),
    );
  }
}
