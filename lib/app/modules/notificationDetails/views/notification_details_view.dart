import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_details_controller.dart';

class NotificationDetailsView extends GetView<NotificationDetailsController> {
  const NotificationDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: height / 2.5,
                    width: width,
                    child: Image.asset(
                      'assets/images/event_img.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      child: Container(
                    width: width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(240, 241, 242, 0.95),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: height / 50,
                          right: height / 50,
                          bottom: height / 100,
                          top: height / 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height / 100,
                          ),
                           Text(
                            controller.notificationDetails.title.toString(),
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                color: Color.fromRGBO(55, 71, 79, 1),
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: height / 100,
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: height / 50,
              ),
              Padding(
                padding: EdgeInsets.all(height/50),
                child: Text(
                  controller.notificationDetails.body.toString(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Color.fromRGBO(55, 71, 79, 1),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
