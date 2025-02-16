import 'package:flutter/widgets.dart';
 
class NavBarProvider extends ChangeNotifier {
  int _bottomNavBarIdx = 0;
 
  int get bottomNavBarIdx => _bottomNavBarIdx;
  
  set setBottomNavBarIdx(int value) {
    _bottomNavBarIdx = value;
    notifyListeners();
  }
}