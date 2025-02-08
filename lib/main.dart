import 'package:flutter/material.dart';
import 'package:submission1_dennistandelon/data/model/restaurant.dart';
import 'package:submission1_dennistandelon/screen/home/home_screen.dart';
import 'package:submission1_dennistandelon/screen/detail/detail_screen.dart';
import 'package:submission1_dennistandelon/static/navigation_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: NavigationRoute.homeRoute.name,
      routes: {
        NavigationRoute.homeRoute.name: (context) => const HomeScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
              restaurant: ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}

