import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/clinic_model.dart';
import 'package:dobo/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewAllService extends ChangeNotifier {
  List<DoctorListModel>? doctorList;
  List<ClinicModel>? clinicList;
  final Dio dio = Dio();

  Future getDoctorList() async {
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
        LogController.activityLog('ViewAllService', "getDoctorList", "Sucess");
      }
    } on DioError catch (_) {
      LogController.activityLog('ViewAllService', "getDoctorList", "Failed");
    }
  }

  Future getClinicList() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response =
          await dio.get('https://dobo.co.in/api/v1/clinics/clinics/',
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

 
  
}
