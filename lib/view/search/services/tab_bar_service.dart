import 'package:flutter/material.dart';

class SearchTabBarService extends ChangeNotifier {
  int pageIndex = 1;

  void onIndexChange(int v) {
    pageIndex = v;
    notifyListeners();
  }
}
