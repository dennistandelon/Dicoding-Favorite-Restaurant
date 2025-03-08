import 'package:flutter/material.dart';
import '../services/work_manager_service.dart';

class NotificationProvider extends ChangeNotifier {
  bool _isScheduled = false;
  bool get isScheduled => _isScheduled;

  final WorkManagerService _workmanager;

  NotificationProvider(this._workmanager) {
    _workmanager.init();
  }

  Future<void> scheduleDailyNotification(bool value) async {
    _isScheduled = value;

    if (_isScheduled) {
      _workmanager.registerDailyNotification();
      debugPrint('Scheduling Reminder Activated');
    } else {
      _workmanager.cancelNotification();
      debugPrint('Scheduling Reminder Canceled');
    }

    notifyListeners();
  }
}
