import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/relative_model.dart';
import 'package:dobo/view/profile_create/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientDetailsProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isPatient = true;
  List<RelativeModel>? relatives;
  bool get isPatient => _isPatient;
  String name = "";
  String gender = "";
  String age = "";
  Dio dio = Dio();
  void patientChange() {
    _isPatient = !_isPatient;
    notifyListeners();
  }

  int _selectedRelativeIndex = 0;
  int get selectedRelativeIndex => _selectedRelativeIndex;

  DateTime? selectedDate;

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

  void onNameChanged(String v) {
    name = v;
    notifyListeners();
  }

  void onRelaviteIndexChange(int index) {
    _selectedRelativeIndex = index;
    notifyListeners();
  }

  Future<void> addPatient(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    String id = pref.getString('pk') ?? "";

    if (name == '') {
      showSnackBarWrong(context, 'Please enter name');
    } else if (selectedDate == null) {
      showSnackBarWrong(context, 'Please enter dob');
    } else {
      _isLoading = true;
      notifyListeners();
      try {
        final response = await dio.post("${ApiEndpoints.relativeAdd}$id",
            data: {
              "full_name": name,
              "gender": gender,
              "dob":
                  "${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}",
            },
            options: Options(headers: {
              'Authorization': 'Bearer $token',
            }));

        if (response.statusCode == 200) {
          response.statusCode;
          _isLoading = false;
          notifyListeners();
          print(response.data);
          // ignore: use_build_context_synchronously
          showSnackBarSuccess(context, 'Relative added succesfully');
          Navigator.pop(context);
          LogController.activityLog(
              'PatientDetailsProvider', "getSlotes", 'Success');
        }
      } on DioError catch (_) {
        _isLoading = false;
        notifyListeners();
        LogController.activityLog(
            'PatientDetailsProvider', "getSlotes", 'Failed');
      }
    }
  }

  Future getRelatives() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    String id = pref.getString('pk') ?? "";

    try {
      final response = await dio.get("${ApiEndpoints.relativeList}$id",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        List data = response.data;
        relatives = data.map((json) => RelativeModel.fromJson(json)).toList();
        notifyListeners();

        LogController.activityLog(
            'PatientDetailsProvider', "getRelatives", "Success");
      }
    } on DioError catch (e) {
      print(e.error);
      LogController.activityLog(
          'PatientDetailsProvider', "getRelatives", "Failed  ");
    }
  }
}
