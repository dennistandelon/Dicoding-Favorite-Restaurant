import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:submission1_dennistandelon/data/model/restaurant.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initNotifications() async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings iOSInitSettings =
        DarwinInitializationSettings();

    final InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iOSInitSettings,
    );

    await _notificationsPlugin.initialize(initSettings);
  }

  static Future<void> showNotification(Restaurant restaurant) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      '3', // Channel ID
      'Daily Reminder',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(),
    );

    await _notificationsPlugin.show(
      0, // Notification ID
      restaurant.name,
      'Your today restaurant recommendation is ${restaurant.name}',
      notificationDetails,
    );
  }
}
