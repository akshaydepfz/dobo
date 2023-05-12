import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/doctor_details_model.dart';
import 'package:dobo/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorDetailService extends ChangeNotifier {
  final dio = Dio();
  DoctorDetailsModel? doctorDetail;
  List<ReviewModel>? reviews;
  Future<void> getDoctorDetails(String id) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get("${ApiEndpoints.doctorDetails}$id",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        doctorDetail = DoctorDetailsModel.fromJson(response.data);
        notifyListeners();
        LogController.activityLog(
            'DoctorDetailService', "getDoctorDetails", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'DoctorDetailService', "getDoctorDetails", 'Failed');
    }
  }

  Future<void> getDoctorReview(String id) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get("${ApiEndpoints.doctorReview}$id",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List data = response.data;

        reviews = data.map((json) => ReviewModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'DoctorDetailService', "getDoctorReview", 'Success');
      } else {
        LogController.activityLog('DoctorDetailService', "getDoctorReview",
            'Failed with status code ${response.statusCode}');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'DoctorDetailService', "getDoctorReview", 'Failed');
    }
  }
}
