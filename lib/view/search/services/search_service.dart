import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/clinic_model.dart';
import 'package:dobo/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchService extends ChangeNotifier {
  Dio dio = Dio();
  List<DoctorListModel>? doctorList;
  List<ClinicModel>? clinicList;
  String _quary = '';
  String get quary => _quary;
  int pageIndex = 0;
  int _favorieIndex = 0;
  int get favorieIndex => _favorieIndex;
  bool _isFavoriteLoad = false;
  bool get isFavorite => _isFavoriteLoad;
  void oncategoryChange(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void onDoctorQuaryChanged(String v) {
    if (v != '') {
      doctorList = doctorList!
          .where((department) =>
              (department.fullName.toLowerCase().contains(v.toLowerCase())))
          .toList();
      notifyListeners();
    } else {
      getDoctorList('');
    }
  }

  Future getDoctorList(String quary) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get('https://dobo.co.in/api/v1/doctors/',
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
      final response =
          await dio.get('https://dobo.co.in/api/v1/clinics/clinics',
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      if (response.statusCode == 200) {
        List data = response.data;
        clinicList = data.map((json) => ClinicModel.fromJson(json)).toList();
        _isFavoriteLoad = false;
        notifyListeners();
        LogController.activityLog('HomeProvider', "getClinicList", "Sucess");
      }
    } on DioError catch (_) {
      LogController.activityLog('HomeProvider', "getClinicList", "Failed");
    }
  }

  Future addClinicFavorite(BuildContext context, String clinicId,
      bool isFavorite, String quary, int index) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    _favorieIndex = index;
    notifyListeners();
    if (isFavorite) {
      _isFavoriteLoad = true;
      notifyListeners();
      try {
        final response =
            await dio.delete("${ApiEndpoints.removeFavClinic}$clinicId",
                options: Options(headers: {
                  'Authorization': 'Bearer $token',
                }));

        if (response.statusCode == 200) {
          getClinicList('');

          LogController.activityLog(
              'HomeProvider', "addClinicFavorite", "Success");
        }
      } on DioError catch (_) {
        LogController.activityLog(
            'HomeProvider', "addClinicFavorite", "Failed");
      }
    } else {
      try {
        _isFavoriteLoad = true;
        notifyListeners();
        final response = await dio.post("${ApiEndpoints.addFavClinic}$clinicId",
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));

        if (response.statusCode == 200) {
          getClinicList('');
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

  void onClinicQuaryChanged(String v) {
    if (v != '') {
      _quary = v;
      clinicList = clinicList!
          .where((clinicList) =>
              (clinicList.clinicName.toLowerCase().contains(v.toLowerCase())))
          .toList();

      notifyListeners();
    } else {
      getClinicList(quary);
    }
  }
}
