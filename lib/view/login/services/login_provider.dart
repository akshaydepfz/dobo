import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _obsureText = false;

  bool get obsureText => _obsureText;

  void onObscureClicked() {
    _obsureText = !_obsureText;
    notifyListeners();
    print(obsureText);
  }

  // ValidationItem get fields => _fields;

  // void changeFirstName(String value) {
  //   if (value.length >= 3) {
  //     _fields = ValidationItem(value, null);
  //   } else {
  //     _fields = ValidationItem(null, null);
  //   }
  //   notifyListeners();
  // }
}

class ValidationItem {
  final String? username;
  final String? passsword;

  ValidationItem(this.username, this.passsword);
}
