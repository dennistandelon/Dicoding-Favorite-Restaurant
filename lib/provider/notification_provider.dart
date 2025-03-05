import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/services/notification_service.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationService flutterNotificationService;
  
  NotificationProvider(this.flutterNotificationService);

  int _notificationId = 0;
  bool? _permission = false;
  bool? get permission => _permission;
  
  Future<void> requestPermissions() async {
    _permission = await flutterNotificationService.requestPermissions();
    notifyListeners();
  }

  void showNotification() {
    _notificationId += 1;
    flutterNotificationService.showNotification(
      id: _notificationId,
      title: "New Notification",
      body: "This is a new notification with id $_notificationId",
      payload: "This is a payload from notification with id $_notificationId",
    );
  }

  
}