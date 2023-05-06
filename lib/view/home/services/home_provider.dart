import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/clinic_model.dart';
import 'package:dobo/model/reminder_model.dart';
import 'package:dobo/model/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  final dio = Dio();

  List<ClinicModel> clinicList = [];
  List<SliderModel> sliders = [];
  List<ReminderModel> reminders = [];

  Future getNearestClinics() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get(ApiEndpoints.nearestClinic,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        List data = response.data;
        clinicList = data.map((json) => ClinicModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'HomeProvider', "getNearestClinics", "Success");
      }
    } on DioError catch (e) {
      LogController.activityLog('HomeProvider', "getNearestClinics", "Failed");
    }
  }

  Future getSliders() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response =
          await dio.get('https://dobo.co.in/api/v1/patients/sliders/',
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      if (response.statusCode == 200) {
        List data = response.data;
        sliders = data.map((e) => SliderModel.fromJson(e)).toList();
        LogController.activityLog('HomeProvider', "getSliders", "Success");
      }
    } on DioError catch (_) {
      LogController.activityLog('HomeProvider', "getSliders", "Failed");
    }
  }

  Future getReminders() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response =
          await dio.get('https://dobo.co.in/api/v1/patients/reminders/',
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      if (response.statusCode == 200) {
        List data = response.data;
        reminders = data.map((json) => ReminderModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog('HomeProvider', "getReminders", "Sucess");
      }
    } on DioError catch (_) {
      LogController.activityLog('HomeProvider', "getReminders", "Failed");
    }
  }



}
