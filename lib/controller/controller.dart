import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:tutor1/ui/menu_pasien_page/menu_pasien.dart';

class Controller extends GetxController {
  void sendNotification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'test_channel',
          title: 'Title of the notification.',
          body: 'Hello! This is the body of the notification.'),
    );
    Get.snackbar("Perhatian", "Sudah saatnya minum obat",
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3)
    );

    AwesomeNotifications().actionStream.listen((event) {
      Get.to(menu_pasien(nama: ""));
    });
  }
}