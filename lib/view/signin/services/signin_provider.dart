import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/router/app_router.dart';
import 'package:dobo/view/signup/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninProvider extends ChangeNotifier {
  bool _obsureText = false;
  String username = "";
  String password = "";

  bool get obsureText => _obsureText;
  final dio = Dio();

  void onUserNameChanged(String value) {
    username = value;
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    password = value;
    notifyListeners();
  }

  void onObscureClicked() {
    _obsureText = !_obsureText;
    notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    if (validator(context)) {
      try {
        final response = await dio.post(ApiEndpoints.login, data: {
          "username": username,
          "password": password,
        });
        if (response.statusCode == 200 || response.statusCode == 201) {
          final pref = await SharedPreferences.getInstance();

          LogController.activityLog("SigninProvider", "SignIn", "Success");
          print(response.data);
          var data = response.data;
          String token = data['access'];
          String refresh = data['refresh'];
          await pref.setString("accessToken", token);
          await pref.setString("refresh", refresh);

          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, RouteConstants.enableLocation);
        }
      } on DioError catch (e) {
        LogController.activityLog("SigninProvider", "SignIn", "failed");
        print(e);
      }
    }
  }

  bool validator(BuildContext context) {
    if (username == "") {
      showSnackBarWrong(context, "Please enter username");
    } else if (password == "") {
      showSnackBarWrong(context, "Please enter password");
    } else {
      return true;
    }
    return false;
  }
}

// class ValidationItem {
//   final String? username;
//   final String? passsword;

//   ValidationItem(this.username, this.passsword);
// }
