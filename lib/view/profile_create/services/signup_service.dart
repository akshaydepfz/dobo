import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCreateProvider extends ChangeNotifier {
  bool _acceptTC = false;
  bool _isLoading = false;
  bool get isoading => _isLoading;
  String username = "";
  String dob = "";
  String gender = "Male";
  String email = "";
  String address = "";
  bool get acceptTc => _acceptTC;

  File? image;
  final picker = ImagePicker();
  String url = '';
  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  DateTime? selectedDate;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2005),
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

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

  void onDob(String value) {
    dob = value;
    notifyListeners();
  }

  void onAddressChanged(String value) {
    address = value;
    notifyListeners();
  }

  Future<void> profileCreate(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    // ignore: use_build_context_synchronously
    if (validation(context)) {
      _isLoading = true;
      notifyListeners();
      try {
        String fileName = image!.path;
        dio.options.headers["Content-Type"] = "multipart/form-data";
        FormData formData = FormData.fromMap({
          "full_name": username,
          "dob":
              "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}",
          "gender": gender,
          "address": address,
          "email": email,
          'image': await MultipartFile.fromFile(image!.path.toString(),
              filename: fileName),
        });
        final response = await dio.post(ApiEndpoints.profileCreate,
            data: formData,
            options: Options(headers: {
              'Content-Type': 'multipart/form-data',
              'Authorization': 'Bearer $token',
            }));

        if (response.statusCode == 200 || response.statusCode == 201) {
          _isLoading = false;
          notifyListeners();
          print(response.data);
          LogController.activityLog("profileCreate", "Signin", "Success");
          // ignore: use_build_context_synchronously

          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(
              context, RouteConstants.enableLocation);
        }
      } on DioError catch (e) {
        _isLoading = false;
        notifyListeners();
        LogController.activityLog("SignUpService", "profileCreate", "Failed");

        showSnackBarWrong(context, e.response.toString());
      }
    }
  }

  bool validation(BuildContext context) {
    if (username == "") {
      showSnackBarWrong(context, "Please enter your name");
    } else if (selectedDate == null) {
      showSnackBarWrong(context, "Please enter your date of birth");
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

void showSnackBarSuccess(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Colors.green,
  ));
}