import 'package:flutter/widgets.dart';
import 'package:machinetask/services/notificatio.dart';

class DetailProvider with ChangeNotifier {
  showNotification({body, payload, title, url}) {
    AppNotificationService().showNotification(
      url: url,
      body: body,
      id: 0,
      payload: payload,
      title: title,
    );
  }
}

// class DetailProvider with ChangeNotifier {
  
//   // final FlutterLocalNotificationsPlugin notifications =
//   //     FlutterLocalNotificationsPlugin();
//   // final AndroidInitializationSettings androidInitializationSettings =
//   //     AndroidInitializationSettings('ic_launcher');
//   // void initialiseNotification() async {
//   //   InitializationSettings initializationSettings =
//   //       InitializationSettings(android: androidInitializationSettings);
//   //   await notifications.initialize(initializationSettings);
//   // }

//   // void sendNotification(String title, String body) async {
//   //   AndroidNotificationDetails androidNotificationDetails =
//   //       AndroidNotificationDetails('channelId', 'channelName',
//   //           importance: Importance.max, priority: Priority.high);
//   //   NotificationDetails notificationDetails =
//   //       NotificationDetails(android: androidNotificationDetails);
//   //   await notifications.show(0, title, body, notificationDetails,
//   //       payload: 'payload');
//   // }
//   // Future _notificationDetails() async {
//   //   return const NotificationDetails(
//   //       android: AndroidNotificationDetails('channel id', 'channel name',
//   //           importance: Importance.max));
//   // }

//   // Future showNotification(
//   //         {int id = 0, String? title, String? body, String? payload}) async =>
//   //     _notifications.show(id, title, body, await _notificationDetails(),
//   //         payload: payload);
// }
