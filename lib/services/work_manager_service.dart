import 'dart:math';

import 'package:submission1_dennistandelon/data/api/api_services.dart';
import 'package:workmanager/workmanager.dart';
import 'notification_service.dart';
import 'package:submission1_dennistandelon/static/my_workmanager.dart';


@pragma('vm:entry-point')
void callbackDispatcher() {
 Workmanager().executeTask((task, inputData) async {
    final api_data = await ApiServices().getRestaurantList();
    final random_restaurant = api_data.restaurants[Random().nextInt(api_data.restaurants.length)];
    await NotificationService.showNotification(random_restaurant);
 
    return Future.value(true);
 });
}
 
class WorkManagerService {
 final Workmanager _workmanager;
 
 WorkManagerService([Workmanager? workmanager])
     : _workmanager = workmanager ??= Workmanager();
 
 Future<void> init() async {
   await _workmanager.initialize(callbackDispatcher, isInDebugMode: true);
 }
 
 Future<void> runOneOffTask() async {
   await _workmanager.registerOneOffTask(
     MyWorkmanager.oneOff.uniqueName,
     MyWorkmanager.oneOff.taskName,
     constraints: Constraints(
       networkType: NetworkType.connected,
     ),
     initialDelay: const Duration(seconds: 5),
   );
 }

 static DateTime _getNext11AM() {
    final now = DateTime.now();
    final todayAt11AM = DateTime(now.year, now.month, now.day, 11, 0, 0);
    return now.isAfter(todayAt11AM) ? todayAt11AM.add(const Duration(days: 1)) : todayAt11AM;
  }
 
 Future<void> registerDailyNotification() async {
   await _workmanager.registerPeriodicTask(
     MyWorkmanager.periodic.uniqueName,
     MyWorkmanager.periodic.taskName,
     frequency: const Duration(days: 1),
     initialDelay: _getNext11AM().difference(DateTime.now()),
     constraints: Constraints(
       networkType: NetworkType.not_required,
     ),
   );
 }
 
 Future<void> cancelNotification() async {
   await _workmanager.cancelAll();
 }

}
