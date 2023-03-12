import 'package:flutter/material.dart';

class SigninProvider extends ChangeNotifier {
  bool _obsureText = true;
  bool get obsureText => _obsureText;

  void onObscureClicked() {
    _obsureText = !_obsureText;
    notifyListeners();
  }
}

class ValidationItem {
  final String? username;
  final String? passsword;

  ValidationItem(this.username, this.passsword);
}
