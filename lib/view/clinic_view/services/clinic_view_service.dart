import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/clinic_details_model.dart';
import 'package:dobo/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClinicDetailsService extends ChangeNotifier {
  final dio = Dio();
  List<DoctorListModel>? doctorList;
  bool _isFavoriteLoad = false;
  int _favorieIndex = 0;
  int get favorieIndex => _favorieIndex;
  bool get isFavoriteLoad => _isFavoriteLoad;
  ClinicDetailsModel? clinicDetail;

  Future<void> getClinicDetails(String id) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get("${ApiEndpoints.clinicDetails}/$id/",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        clinicDetail = ClinicDetailsModel.fromJson(response.data);

        notifyListeners();
        LogController.activityLog(
            'ClinicDetailsService', "getClinicDetails", 'Success');
      }
    } on DioError catch (e) {
      print(e.response!.data);
      LogController.activityLog(
          'ClinicDetailsService', "getClinicDetails", 'Failed');
    }
  }

  Future addDoctorFavorite(BuildContext context, String doctorId,
      bool isFavorite, int index, String clinicId) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    _favorieIndex = index;
    notifyListeners();
    if (isFavorite) {
      _isFavoriteLoad = true;
      notifyListeners();
      try {
        final response = await dio.delete(
          "https://dobo.co.in/api/v1/doctors/add_favorite/?doctor_id=$doctorId",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }),
        );

        if (response.statusCode == 200) {
          _isFavoriteLoad = false;
          notifyListeners();
          LogController.activityLog(
              'HomeProvider', "addDoctorFavorite", "Success");
          getDoctorList(clinicId);
        }
      } on DioError catch (_) {
        _isFavoriteLoad = false;
        notifyListeners();
        LogController.activityLog(
            'HomeProvider', "addDoctorFavorite", "Failed");
      }
    } else {
      try {
        _isFavoriteLoad = true;
        notifyListeners();
        final response = await dio.post(
            "https://dobo.co.in/api/v1/doctors/add_favorite/?doctor_id=$doctorId",
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));

        if (response.statusCode == 200) {
          _isFavoriteLoad = false;
          notifyListeners();
          LogController.activityLog(
              'HomeProvider', "addClinicFavorite", "Success");
          getDoctorList(clinicId);
        }
      } on DioError catch (_) {
        _isFavoriteLoad = false;
        notifyListeners();
        LogController.activityLog(
            'HomeProvider', "addClinicFavorite", "Failed");
      }
    }
  }

  Future<void> getDoctorList(String clinicId) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response =
          await dio.get("${ApiEndpoints.clinicDoctorsList}$clinicId",
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));
      if (response.statusCode == 200) {
        List data = response.data;
        doctorList =
            data.map((json) => DoctorListModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'ClinicDetailsService', "getDoctorList", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'ClinicDetailsService', "getDoctorList", 'Failed');
    }
  }
}
