import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/doctor_model.dart';
import 'package:dobo/view/category/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProvider extends ChangeNotifier {
  final dio = Dio();
  List<DoctorListModel>? doctors;
  List<DepartmentModel>? departments;
  // List<CategoryModel> categoryItems = [
  //   CategoryModel(
  //       icon: 'assets/icons/categories/doctor.png', title: 'General Physician'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/teeth.png', title: 'Dental Specialist'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/hair.png', title: 'Skin Specialist'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/kid.png', title: 'Children Specialist'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/stomach.png',
  //       title: 'Internal Medicine'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/child.png',
  //       title: 'Obsteric Gynecologist'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/heart.png', title: 'Cardiologist'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/eye.png', title: 'Eye Specialist'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/reproduction.png',
  //       title: 'Reproduction'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/brain.png', title: 'Neurologist'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/ears.png', title: 'Ear Nose Throat'),
  //   CategoryModel(
  //       icon: 'assets/icons/categories/nutrition.png', title: 'Nutritionist'),
  // ];

  Future<void> getDoctorList(String department) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response =
          await dio.get("${ApiEndpoints.doctorDepartmentfilter}$department",
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));
      if (response.statusCode == 200) {
        List data = response.data;
        doctors = data.map((json) => DoctorListModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'ClinicDetailsService', "getDoctorList", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'ClinicDetailsService', "getDoctorList", 'Failed');
    }
  }

  Future<void> getDepartments() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get(ApiEndpoints.getDepartments,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List data = response.data;
        departments =
            data.map((json) => DepartmentModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'ClinicDetailsService', "getDepartments", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'ClinicDetailsService', "getDepartments", 'Failed');
    }
  }
}
