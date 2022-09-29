import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AppNotificationService {
  late FlutterLocalNotificationsPlugin notification;

  AppNotificationService() {
    notification = FlutterLocalNotificationsPlugin();
    initNotification();
  }
  initNotification() async {
    const androdInitSettings = AndroidInitializationSettings('ic_launcher');

    const initializationSettings = InitializationSettings(
      android: androdInitSettings,
    );
    await notification.initialize(
      initializationSettings,
    );
  }

  Future showNotification(
      {int id = 10, String? title, String? body, String? payload, url}) async {
    await notification.show(id, title, body, await _notificationDetails(url),
        payload: payload);
  }

  void cancelNotification(int id) {
    notification.cancel(id);
  }

  void cancelAllNotifications() {
    notification.cancelAll();
  }

  Future<String?> downloadAndSavePicture(String? url) async {
    if (url == null) return null;
    log(url);
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/image.png';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  dynamic img;
  Future _notificationDetails(url) async {
    img = await downloadAndSavePicture(url);
    final styleInformation = BigPictureStyleInformation(
      htmlFormatContent: true,
      htmlFormatTitle: true,
      FilePathAndroidBitmap(img),
    );
    return NotificationDetails(
      android: AndroidNotificationDetails('channel id', 'channel name',
          channelDescription: 'channel description',
          styleInformation: styleInformation,
          enableVibration: true,
          enableLights: true,
          color: Colors.blue,
          playSound: true,
          importance: Importance.max,
          priority: Priority.max),
    );
  }

  onSelectNotification(String? payload) {}
}
