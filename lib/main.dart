import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/data/api/api_services.dart';
import 'package:submission1_dennistandelon/provider/navbar_provider.dart';
import 'package:submission1_dennistandelon/provider/restaurant_list_provider.dart';
import 'package:submission1_dennistandelon/provider/restaurant_detail_provider.dart';
import 'package:submission1_dennistandelon/screen/main_screen.dart';
import 'package:submission1_dennistandelon/screen/detail/detail_screen.dart';
import 'package:submission1_dennistandelon/screen/search/search_screen.dart';
import 'package:submission1_dennistandelon/static/navigation_route.dart';
import 'package:submission1_dennistandelon/style/theme/restaurant_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
         create: (context) => NavBarProvider(),
        ),
        Provider(
         create: (context) => ApiServices(),
        ),
        ChangeNotifierProvider(
         create: (context) => RestaurantListProvider(
           context.read<ApiServices>(),
         )
        ),
        ChangeNotifierProvider(
         create: (context) => RestaurantDetailProvider(
           context.read<ApiServices>(),
         )
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: RestaurantTheme.lightTheme,
        darkTheme: RestaurantTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: NavigationRoute.homeRoute.name,
        routes: {
          NavigationRoute.homeRoute.name: (context) => const MainScreen(),
          NavigationRoute.detailRoute.name: (context) => DetailScreen(
                restaurantId: ModalRoute.of(context)?.settings.arguments as String,
              ),
          NavigationRoute.searchRoute.name: (context) => const SearchScreen(),
        },
      ),
    );
  }
}

