import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/clinic_model.dart';
import 'package:dobo/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchService extends ChangeNotifier {
  bool _searchDoctor = true;
  bool get searchDoctor => _searchDoctor;
  Dio dio = Dio();
  List<DoctorListModel>? doctorList;
  List<ClinicModel>? clinicList;
  void oncategoryChange() {
    _searchDoctor = !_searchDoctor;
    notifyListeners();
  }

  Future getDoctorList(String quary) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response =
          await dio.get('https://dobo.co.in/api/v1/doctors/?search=$quary',
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      if (response.statusCode == 200) {
        List data = response.data;
        doctorList =
            data.map((json) => DoctorListModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog('HomeProvider', "getDoctorList", "Sucess");
      }
    } on DioError catch (_) {
      LogController.activityLog('HomeProvider', "getDoctorList", "Failed");
    }
  }

  Future getClinicList(String quary) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get(
          'https://dobo.co.in/api/v1/clinics/clinics/?search=$quary',
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        List data = response.data;
        clinicList = data.map((json) => ClinicModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog('HomeProvider', "getClinicList", "Sucess");
      }
    } on DioError catch (_) {
      LogController.activityLog('HomeProvider', "getClinicList", "Failed");
    }
  }

  Future addClinicFavorite(BuildContext context, String clinicId,
      bool isFavorite, String quary) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    if (isFavorite) {
      try {
        final response =
            await dio.delete("${ApiEndpoints.removeFavClinic}$clinicId",
                options: Options(headers: {
                  'Authorization': 'Bearer $token',
                }));

        if (response.statusCode == 200) {
          print(response.data);
          LogController.activityLog(
              'HomeProvider', "addClinicFavorite", "Success");
        }
      } on DioError catch (e) {
        LogController.activityLog(
            'HomeProvider', "addClinicFavorite", "Failed");
      }
    } else {
      try {
        final response = await dio.post("${ApiEndpoints.addFavClinic}$clinicId",
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));

        if (response.statusCode == 200) {
          LogController.activityLog(
              'HomeProvider', "addClinicFavorite", "Success");
          getClinicList(quary);
        }
      } on DioError catch (_) {
        LogController.activityLog(
            'HomeProvider', "addClinicFavorite", "Failed");
      }
    }
  }
}
