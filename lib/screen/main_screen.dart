import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/provider/navbar_provider.dart';
import 'package:submission1_dennistandelon/provider/preference_provider.dart';
import 'package:submission1_dennistandelon/screen/home/home_screen.dart';
import 'package:submission1_dennistandelon/screen/search/search_screen.dart';
import 'package:submission1_dennistandelon/screen/favorite/favorite_screen.dart';
import 'package:submission1_dennistandelon/screen/setting/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkTheme = Provider.of<PreferenceProvider>(context).isDarkTheme;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<NavBarProvider>().bottomNavBarIdx,
        onTap: (index) {
          context.read<NavBarProvider>().setBottomNavBarIdx = index;
        },
        selectedItemColor: isDarkTheme ? Colors.white : theme.primaryColor, // Active icon color
        unselectedItemColor: isDarkTheme ? Colors.grey[400] : Colors.grey[700], // Inactive icon color
        backgroundColor: theme.bottomNavigationBarTheme.backgroundColor, // Background color
        items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Restaurants',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
        ],
      ),
      body: _children[context.watch<NavBarProvider>().bottomNavBarIdx],
    );
  }
}