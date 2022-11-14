import 'package:flutter/material.dart';

class BottomNavService extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onTabClicked(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
  
}
