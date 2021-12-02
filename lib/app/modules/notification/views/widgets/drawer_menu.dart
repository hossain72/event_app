import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    var width = Get.width;
    return SizedBox(
      width: width / 1.2,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: const EdgeInsets.only(left: 0.0, top: 25.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: ListTile(
                leading: Container(
                  //height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80)),
                  child: const CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                    AssetImage('assets/images/event_img.png'),
                  ),
                ),
                title: const Text(
                  "User Name",
                  style: TextStyle(),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.person_outline, color: Colors.black),
              title: const Text(
                'Profile',
              ),
            ),
            ListTile(
              onTap: () {},
              leading:
              const Icon(Icons.support_agent_outlined, color: Colors.black),
              title: const Text(
                'Support',
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.language, color: Colors.black),
              title: Text(
                'Language'.tr,
              ),
            ),
            ListTile(
              onTap: () {},
              leading:
              const Icon(Icons.logout, color: Colors.black),
              title: const Text(
                'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

