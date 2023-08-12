import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/clinic_model.dart';
import 'package:dobo/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  List<ClinicModel>? clinicList;
  List<DoctorListModel>? doctors;
  Dio dio = Dio();

  bool _isFavoriteLoad = false;
  int _favorieIndex = 0;
  int get favorieIndex => _favorieIndex;
  bool get isFavoriteLoad => _isFavoriteLoad;

  Future getfavoriteClinics() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response =
          await dio.get("https://dobo.co.in/api/v1/clinics/clinics/favorites/",
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      if (response.statusCode == 200) {
        List data = response.data;
        clinicList = data.map((json) => ClinicModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'FavoriteProvider', "getfavoriteClinics", "Success");
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'FavoriteProvider', "getfavoriteClinics", "Failed  ");
    }
  }

  Future getfavoritedoctors() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response =
          await dio.get("https://dobo.co.in/api/v1/doctors/favorites/",
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      if (response.statusCode == 200) {
        List data = response.data;
        doctors = data.map((json) => DoctorListModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'FavoriteProvider', "getfavoritedoctors", "Success");
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'FavoriteProvider', "getfavoritedoctors", "Failed  ");
    }
  }

  Future addClinicFavorite(
      BuildContext context, String clinicId, bool isFavorite) async {
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
          LogController.activityLog(
              'HomeProvider', "addClinicFavorite", "Success");
          getfavoriteClinics();
        }
      } on DioError catch (_) {
        LogController.activityLog(
            'HomeProvider', "addClinicFavorite", "Failed");
      }
    }
  }
}
