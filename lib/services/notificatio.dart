import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
      {int id = 0, String? title, String? body, String? payload, url}) async {
    await notification.show(id, title, body, await _notificationDetails(url),
        payload: payload);
  }

  void cancelNotification(int id) {
    notification.cancel(id);
  }

  void cancelAllNotifications() {
    notification.cancelAll();
  }

  Future _notificationDetails(url) async {
    // final bigPicturePath = await NetworkImage(url);
    final styleInformation = BigPictureStyleInformation(
      htmlFormatContent: true,
      htmlFormatTitle: true,
      FilePathAndroidBitmap(url),
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
