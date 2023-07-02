import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientDetailsProvider extends ChangeNotifier {
  bool _isPatient = true;
  bool get isPatient => _isPatient;
  String name = "";
  String gender = "";
  String age = "";
  Dio dio = Dio();
  void patientChange() {
    _isPatient = !_isPatient;
    notifyListeners();
  }

  DateTime? selectedDate;
  Future<void> getSlotes(String doctorId) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    String id = pref.getString('pk') ?? "";
    try {
      final response = await dio.post("${ApiEndpoints.relativeAdd}$id",
          data: {
            "full_name": name,
            "gender": gender,
            "dob": name,
          },
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        notifyListeners();
        LogController.activityLog(
            'PatientDetailsProvider', "getSlotes", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'PatientDetailsProvider', "getSlotes", 'Failed');
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2005),
        firstDate: DateTime(1980, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }
}
