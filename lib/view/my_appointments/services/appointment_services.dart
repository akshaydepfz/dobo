import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/appointment_list_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentService extends ChangeNotifier {
  final dio = Dio();

  List<AppointmentListModel>? upcomingAppontments;
  List<AppointmentListModel>? completedAppontments;
  List<AppointmentListModel>? cancelleddAppontments;

  Future<void> getAppointmentList() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get(ApiEndpoints.appointmentList,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List data = response.data;

        upcomingAppontments =
            data.map((json) => AppointmentListModel.fromJson(json)).toList();
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
