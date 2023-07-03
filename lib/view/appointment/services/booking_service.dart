import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/doctor_details_model.dart';
import 'package:dobo/model/relative_model.dart';
import 'package:dobo/model/slote_model.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/profile_create/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingService extends ChangeNotifier {
  DateTime? selectdappointmentDate;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isPatient = true;
  List<RelativeModel>? relatives;
  bool get isPatient => _isPatient;
  String name = "";
  String doctorID = '';
  String gender = "";
  String age = "";
  String description = '';

  int _selectedSlotIndex = 0;
  int get selectedSlotIndex => _selectedSlotIndex;
  String _selectedSlotId = '';
  String get selectedSlotId => _selectedSlotId;
  Dio dio = Dio();
  List<SloteModel>? slotes;
  DoctorDetailsModel? doctorDetail;
  void doctorIDStore(String id) {
    doctorID = id;
    notifyListeners();
  }

  void ondescriptionChange(String v) {
    description = v;
    notifyListeners();
  }

  void onDateChanged(DateTime date) {
    selectdappointmentDate = date;
    notifyListeners();
  }

  void onSlotChange(int i, String id) {
    _selectedSlotId = id;
    _selectedSlotIndex = i;
    notifyListeners();
  }

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

  Future<void> getSlotes(String doctorId) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get("${ApiEndpoints.slotes}$doctorId",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        List data = response.data;

        slotes = data.map((json) => SloteModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog('BookingService', "getSlotes", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog('BookingService', "getSlotes", 'Failed');
    }
  }

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
      // ignore: use_build_context_synchronously
      showSnackBarWrong(context, 'Please enter name');
    } else if (selectedDate == null) {
      // ignore: use_build_context_synchronously
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

          // ignore: use_build_context_synchronously
          showSnackBarSuccess(context, 'Relative added succesfully');
          // ignore: use_build_context_synchronously
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
    } on DioError catch (_) {
      LogController.activityLog(
          'PatientDetailsProvider', "getRelatives", "Failed  ");
    }
  }

  Future addAppointment(BuildContext context, String patientID) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    String id = pref.getString('pk') ?? "";

    try {
      _isLoading = true;
      notifyListeners();
      final response = await dio.post(ApiEndpoints.addAppointment,
          data: {
            "schedule": selectedSlotId,
            "date":
                "${selectdappointmentDate!.year}-${selectdappointmentDate!.month}-${selectdappointmentDate!.day}",
            "patient": isPatient ? id : patientID,
          },
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200 || response.statusCode == 201) {
        _isLoading = false;
        notifyListeners();
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, RouteConstants.bookingDonePop);
        LogController.activityLog(
            'PatientDetailsProvider', "addAppointment", "Success");
      }
    } on DioError catch (_) {
      _isLoading = false;
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, RouteConstants.bookingDonePop);
      notifyListeners();
      LogController.activityLog(
          'PatientDetailsProvider', "addAppointment", "Failed");
    }
  }
}
