// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/user_model.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/profile_create/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService extends ChangeNotifier {
  final dio = Dio();
  UserModel? userModel;
  String? helpCenterHTML;
  FormData formData = FormData();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get emailController => _emailController;

  File? image;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> logOut(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();

    Navigator.pushReplacementNamed(context, RouteConstants.signInScreen);
  }

  Future<void> setProfileEdit() async {
    _nameController.text = userModel!.firstName;
    _emailController.text = userModel!.email;
    _phoneController.text = userModel!.phone;
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
        LogController.activityLog(
            'ProfileProvider', 'Get User Details', "success");
        userModel = UserModel.fromJson(response.data);

        notifyListeners();
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'ProfileProvider', 'Get User Details', "Failed");
    }
  }

  Future<void> getHelpcenterHTML() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get(
        ApiEndpoints.helpCenter,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        LogController.activityLog(
            'ProfileProvider', 'getHelpcenterHTML', "success");
        helpCenterHTML = response.data['help_center'];
        notifyListeners();
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'ProfileProvider', 'getHelpcenterHTML', "Failed");
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    String id = pref.getString('pk') ?? "";

    try {
      _isLoading = true;
      notifyListeners();

      if (image != null) {
        String fileName = image!.path;
        formData = FormData.fromMap({
          "phone": _phoneController.text,
          "email": _emailController.text,
          "full_name": _nameController.text,
          'image': image == null
              ? ""
              : await MultipartFile.fromFile(image!.path.toString(),
                  filename: fileName),
        });
        notifyListeners();
      } else {
        formData = FormData.fromMap({
          "phone": _phoneController.text,
          "email": _emailController.text,
          "full_name": _nameController.text,
        });
        notifyListeners();
      }

      dio.options.headers["Content-Type"] = "multipart/form-data";
      final response = await dio.patch("${ApiEndpoints.locationPatch}$id/",
          data: formData,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ));
      if (response.statusCode == 200 || response.statusCode == 201) {
        LogController.activityLog('ProfileService', "updateProfile", 'Success');

        getProfileDetails();
        setProfileEdit();
        _isLoading = false;
        notifyListeners();
        Navigator.pop(context);
        showSnackBarSuccess(context, 'Profile edit successfully');
      }
    } on DioError catch (e) {
      LogController.activityLog('ProfileService', "updateProfile", 'Failed');
      _isLoading = false;
      notifyListeners();

      showSnackBarWrong(context, e.response.toString());
    }
  }
}
