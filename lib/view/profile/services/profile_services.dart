import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/user_model.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService extends ChangeNotifier {
  final dio = Dio();
  UserModel? userModel;

  bool isLoading = false;

  Future<void> logOut(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigator.pushReplacementNamed(context, RouteConstants.signInScreen);
  }

  Future<void> getProfileDetails() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get(
        ApiEndpoints.profileDetailsGet,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        LogController.activityLog('ProfileProvider', 'Get User Details', "success");
        userModel = UserModel.fromJson(response.data);
      }
    } on DioError catch (_) {
              LogController.activityLog('ProfileProvider', 'Get User Details', "Failed");
    }
  }
}
