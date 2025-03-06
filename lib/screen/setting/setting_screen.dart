import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/provider/notification_provider.dart';
import 'package:submission1_dennistandelon/provider/preference_provider.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceProvider>(
      builder: (context, provider, _) {
        
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: ListView(
            children: [
              SwitchListTile(
                title: const Text('Dark Theme'),
                value: provider.isDarkTheme,
                onChanged: (value) {
                  provider.setTheme(value);
                },
              ),
              SwitchListTile(
                title: const Text('Daily Reminder'),
                value: provider.isDailyReminderActive,
                onChanged: (value) {
                  context.read<NotificationProvider>().scheduleDailyNotification(value);
                  
                  provider.setDailyReminder(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}