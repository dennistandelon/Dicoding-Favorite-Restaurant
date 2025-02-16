import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission1_dennistandelon/provider/navbar_provider.dart';
import 'package:submission1_dennistandelon/screen/home/home_screen.dart';
import 'package:submission1_dennistandelon/screen/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.watch<NavBarProvider>().bottomNavBarIdx,
        onTap: (index) {
          context.read<NavBarProvider>().setBottomNavBarIdx = index;
        },
        items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Restaurants',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
        ],
      ),
      body: _children[context.watch<NavBarProvider>().bottomNavBarIdx],
    );
  }
}