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

        Future<void> _requestPermission() async {
          context.read<NotificationProvider>().requestPermissions();
        }

        Future<void> _showNotification() async {
          context.read<NotificationProvider>().showNotification();
        }
        
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
              ElevatedButton(
               onPressed: () async {
                 await _requestPermission();
               },
               child: Consumer<NotificationProvider>(
                 builder: (context, value, child) {

                    return Text(
                      "Request permission! (${value.permission})",
                      textAlign: TextAlign.center,
                    );
                 },
               ),
             ),
            ],
          ),
        );
      },
    );
  }
}