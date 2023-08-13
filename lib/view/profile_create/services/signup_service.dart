import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCreateProvider extends ChangeNotifier {
  bool _acceptTC = false;
  bool _isLoading = false;
  bool get isoading => _isLoading;
  String username = "";
  String dob = "";
  String gender = "Male";
  String email = "";
  String address = "";
  String whatsapp = "";
  bool get acceptTc => _acceptTC;

  File? image;
  final picker = ImagePicker();

  void onGenderChange(String v) {
    gender = v;
    notifyListeners();
  }

  void launchURL() async {
    const url = 'https://dobo.co.in/terms-and-conditions';
    await launch(url);
  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  FormData formData = FormData.fromMap({});

  DateTime selectedDate = DateTime(2023);

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked; // Update the selected date

      notifyListeners();
    }

    print(picked);
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

  void onWhatsappChange(String value) {
    whatsapp = value;
    notifyListeners();
  }

  Future<void> profileCreate(BuildContext context) async {
    if (image != null) {
      String fileName = image!.path;
      dio.options.headers["Content-Type"] = "multipart/form-data";
      formData = FormData.fromMap({
        "full_name": username,
        "dob":
            "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}",
        "gender": gender,
        "address": address,
        "email": email,
        "whatsapp_number": whatsapp,
        'image': await MultipartFile.fromFile(image!.path.toString(),
            filename: fileName),
      });
      notifyListeners();
    } else {
      formData = FormData.fromMap({
        "full_name": username,
        "dob": "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
        "gender": gender,
        "address": address,
        "email": email,
        "whatsapp_number": whatsapp,
      });
      notifyListeners();
    }

    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    // ignore: use_build_context_synchronously
    if (validation(context)) {
      _isLoading = true;
      notifyListeners();
      try {
        final response = await dio.post(ApiEndpoints.profileCreate,
            data: formData,
            options: Options(headers: {
              // 'Content-Type': 'multipart/form-data',
              'Authorization': 'Bearer $token',
            }));

        if (response.statusCode == 200 || response.statusCode == 201) {
          log(response.statusCode.toString());
          log(response.data.toString());
          _isLoading = false;
          notifyListeners();
          LogController.activityLog("profileCreate", "Signin", "Success");
          final pref = await SharedPreferences.getInstance();

          var data = response.data;

          String pk = data['pk'].toString();
          await pref.setString("pk", pk);
          // ignore: use_build_context_synchronously

          // ignore: use_build_context_synchronously
          // showSnackBarSuccess(context, response.data.toString());
          Navigator.pushReplacementNamed(
              context, RouteConstants.enableLocation);
        }
      } on DioError catch (e) {
        _isLoading = false;
        notifyListeners();
        LogController.activityLog("SignUpService", "profileCreate", "Failed");

        // ignore: use_build_context_synchronously
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
