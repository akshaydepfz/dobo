import 'package:flutter/material.dart';

class SignUpService extends ChangeNotifier {
  bool _acceptTC = false;

  bool get acceptTc => _acceptTC;

  void checkBoxClick() {
    _acceptTC = !acceptTc;
    notifyListeners();
  }
}
