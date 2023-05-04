import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:flutter/material.dart';

class SignUpService extends ChangeNotifier {
  bool _acceptTC = false;

  String username = "";
  String password = "";
  String password2 = "";
  String email = "";

  bool get acceptTc => _acceptTC;

  final dio = Dio();

  void checkBoxClick() {
    _acceptTC = !acceptTc;
    notifyListeners();
  }

  void onUserNameChanged(String value) {
    username = value;
    notifyListeners();
  }

  void onEmailChanged(String value) {
    email = value;
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    password = value;
    notifyListeners();
  }

  void onPassword2Changed(String value) {
    password2 = value;
    notifyListeners();
  }

  Future<void> signUp(BuildContext context) async {
    if (validation(context)) {
      try {
        final response = await dio.post(ApiEndpoints.register, data: {
          "username": username,
          "password": password,
          "password2": password2,
          "user_type": "patient",
          "email": email,
          "first_name": "username",
        });

        if (response.statusCode == 200 || response.statusCode == 201) {
          LogController.activityLog("SignUpService", "Signin", "Success");
        }
      } on DioError catch (e) {
        LogController.activityLog("SignUpService", "Signin", "Failed");
        print(e.message);
      }
    }
  }

  bool validation(BuildContext context) {
    if (username == "") {
      showSnackBarWrong(context, "Please enter your name");
    } else if (email == "") {
      showSnackBarWrong(context, "Please enter your email");
    } else if (password == "") {
      showSnackBarWrong(context, "Please enter your password");
    } else if (password != password2) {
      showSnackBarWrong(context, "Password not matching");
    } else if (_acceptTC == false) {
      showSnackBarWrong(context, "Please accept the terms and conditions");
    } else {
      return true;
    }
    return false;
  }
}

void showSnackBarWrong(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  ));
}
