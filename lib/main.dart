import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/data/api/api_services.dart';
import 'package:submission1_dennistandelon/data/database/sqlite_service.dart';
import 'package:submission1_dennistandelon/provider/navbar_provider.dart';
import 'package:submission1_dennistandelon/provider/notification_provider.dart';
import 'package:submission1_dennistandelon/provider/preference_provider.dart';
import 'package:submission1_dennistandelon/provider/restaurant_list_provider.dart';
import 'package:submission1_dennistandelon/provider/restaurant_detail_provider.dart';
import 'package:submission1_dennistandelon/provider/search_provider.dart';
import 'package:submission1_dennistandelon/screen/main_screen.dart';
import 'package:submission1_dennistandelon/screen/detail/detail_screen.dart';
import 'package:submission1_dennistandelon/screen/search/search_screen.dart';
import 'package:submission1_dennistandelon/static/navigation_route.dart';
import 'package:submission1_dennistandelon/style/theme/restaurant_theme.dart';
import 'package:submission1_dennistandelon/provider/database_provider.dart';
import 'package:submission1_dennistandelon/services/notification_service.dart';
import 'package:submission1_dennistandelon/services/work_manager_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
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
              )),
      ChangeNotifierProvider(
          create: (context) => RestaurantDetailProvider(
                context.read<ApiServices>(),
              )),
      ChangeNotifierProvider(
          create: (context) => SearchProvider(
                context.read<ApiServices>(),
              )),
      Provider(
        create: (context) => SqliteService(),
      ),
      ChangeNotifierProvider(
        create: (context) => DatabaseProvider(
          context.read<SqliteService>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => PreferenceProvider(),
      ),
      Provider(
        create: (context) => NotificationService.initNotifications(),
      ),
      ChangeNotifierProvider(
        create: (context) => NotificationProvider(WorkManagerService()),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<PreferenceProvider>(context);

    return MaterialApp(
      title: 'Restaurant Favorite App',
      theme: RestaurantTheme.lightTheme,
      darkTheme: RestaurantTheme.darkTheme,
      themeMode: themeProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      initialRoute: NavigationRoute.homeRoute.name,
      routes: {
        NavigationRoute.homeRoute.name: (context) => const MainScreen(),
        NavigationRoute.detailRoute.name: (context) => DetailScreen(
              restaurantId:
                  ModalRoute.of(context)?.settings.arguments as String,
            ),
        NavigationRoute.searchRoute.name: (context) => const SearchScreen(),
      },
    );
  }
}
