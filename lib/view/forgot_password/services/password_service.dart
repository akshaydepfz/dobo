import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/view/profile_create/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordService extends ChangeNotifier {
  final dio = Dio();
  bool _isLoading = false;
  String email = '';

  bool get isLoading => _isLoading;

  void onPasswordChange(String value) async {
    email = value;
    notifyListeners();
  }

  Future<void> getRestMailLink(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    if (email.contains('@')) {
      _isLoading = true;
      notifyListeners();
      try {
        final response = await dio.post(
          ApiEndpoints.restPassword,
          queryParameters: {"email": email},
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );

        if (response.statusCode == 200) {
          // ignore: use_build_context_synchronously
          showSnackBarSuccess(context,
              'The email to reset your password were successfully sent to your inbox');

          LogController.activityLog(
              'PasswordProvider', 'RestPasswordLink', 'Success');

          _isLoading = false;
          notifyListeners();
        } else {
          // ignore: use_build_context_synchronously
          showSnackBarWrong(context, 'Something went wrong');
          LogController.activityLog(
              'PasswordProvider', 'RestPasswordLink', 'Failed');
        }
      } on DioError catch (_) {
        LogController.activityLog(
            'PasswordProvider', 'RestPasswordLink', 'Failed');
        _isLoading = false;
        notifyListeners();
      }
    } else {
      // ignore: use_build_context_synchronously
      showSnackBarWrong(context, 'Please enter your mail');
    }
  }
}
