import 'package:flutter/material.dart';

class RescheduleRadioService extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onRadioButtonChanged(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
