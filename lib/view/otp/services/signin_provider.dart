import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/view/location_select/screens/location_select_screen.dart';
import 'package:dobo/view/otp/screens/otp_auth_screen.dart';
import 'package:dobo/view/profile_create/screens/profile_create_screen.dart';
import 'package:dobo/view/profile_create/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool created = false;
  bool get isLoading => _isLoading;
  bool _obsureText = false;
  String mobile = "";
  bool get obsureText => _obsureText;
  final dio = Dio();

  void onUserNameChanged(String value) {
    mobile = value;
    notifyListeners();
  }

  void onObscureClicked() {
    _obsureText = !_obsureText;
    notifyListeners();
  }

  Future<void> getOTP(BuildContext context) async {
    if (mobile.length < 10) {
      showSnackBarWrong(context, "Please enter valid mobile number");
    } else {
      _isLoading = true;
      notifyListeners();
      try {
        final response = await dio.post(ApiEndpoints.login, data: {
          "mobile": "91$mobile",
          "user_type": "patient",
        });
        if (response.statusCode == 200) {
          final data = response.data;

          _isLoading = false;
          created = data['created'];

          notifyListeners();

          LogController.activityLog("SigninProvider", "getOTP", "Success");
          // ignore: use_build_context_synchronously
          showSnackBarSuccess(context, 'OTP Sent to the given mobile number');
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const OtpAuthScreen()));
        }
      } on DioError catch (e) {
        _isLoading = false;
        notifyListeners();
        LogController.activityLog("SigninProvider", "getOTP", "failed");
        showSnackBarWrong(context, e.response!.data.toString());
      }
    }
  }

  Future<void> verifyOTP(BuildContext context, String otp) async {
    if (otp.length < 6) {
      showSnackBarWrong(context, "Please enter valid mobile number");
    } else {
      try {
        final response = await dio.post(
            "https://dobo.co.in/api/v1/accounts/login-next/?username=91$mobile",
            data: {
              "otp": otp,
            });

        _isLoading = true;
        notifyListeners();
        if (response.statusCode == 200) {
          _isLoading = false;
          notifyListeners();
          LogController.activityLog("SigninProvider", "verifyOTP", "Success");
          // ignore: use_build_context_synchronously
          // ignore: use_build_context_synchronously
          final pref = await SharedPreferences.getInstance();
          var data = response.data;
          String userType = data['user_type'];
          if (userType == 'patient') {
            String token = data['access_token'];
            String refresh = data['refresh_token'];
            String pk = data['profile_id'].toString();

            await pref.setString("pk", pk);
            await pref.setString("accessToken", token);
            await pref.setString("refresh", refresh);
            _isLoading = false;
            notifyListeners();
            // ignore: use_build_context_synchronously
            showSnackBarSuccess(context, 'Verification successfull');

            if (data['profile_id'] == '') {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileCreateScreen()));
            } else {
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LocationSelectScreen()));
            }
          } else {
            // ignore: use_build_context_synchronously
            showSnackBarWrong(
                context, 'You are already register as a $userType');
          }
        }
      } on DioError catch (e) {
        _isLoading = false;
        notifyListeners();
        LogController.activityLog("SigninProvider", "verifyOTP", "failed");
        showSnackBarWrong(context, e.response!.data.toString());
      }
    }
  }
}
