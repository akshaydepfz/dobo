import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/appointment_list_model.dart';
import 'package:dobo/model/clinic_details_model.dart';
import 'package:dobo/model/doctor_details_model.dart';
import 'package:dobo/view/booking_animation/screens/appointment_cancel_pop.dart';
import 'package:dobo/view/profile_create/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentService extends ChangeNotifier {
  final dio = Dio();

  List<AppointmentListModel>? upcomingAppontments;
  List<AppointmentListModel>? completedAppontments;
  List<AppointmentListModel>? cancelleddAppontments;
  ClinicDetailsModel? clinicDetail;
  DoctorDetailsModel? doctorDetail;

  void onBackPressed() {
    doctorDetail = null;
    clinicDetail = null;
    notifyListeners();
  }

  Future<void> getUpcomingAppointments() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get("${ApiEndpoints.appointmentList}pending",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List data = response.data;

        upcomingAppontments =
            data.map((json) => AppointmentListModel.fromJson(json)).toList();

        notifyListeners();
        LogController.activityLog(
            'AppointmentService', "getUpcomingAppointments", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'AppointmentService', "getUpcomingAppointments", 'Failed');
    }
  }

  Future<void> getCompletdAppointments() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get("${ApiEndpoints.appointmentList}completed",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List data = response.data;

        completedAppontments =
            data.map((json) => AppointmentListModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'AppointmentService', "getCompletdAppointments", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'AppointmentService', "getCompletdAppointments", 'Failed');
    }
  }

  Future<void> getCancelledAppintments() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get("${ApiEndpoints.appointmentList}cancelled",
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List data = response.data;

        cancelleddAppontments =
            data.map((json) => AppointmentListModel.fromJson(json)).toList();
        notifyListeners();

        LogController.activityLog(
            'AppointmentService', "getCancelledAppintments", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'AppointmentService', "getCancelledAppintments", 'Failed');
    }
  }

  Future<void> cancellAppointment(
      BuildContext context, String appointmentId, String resone) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response =
          await dio.post("${ApiEndpoints.cancellAppointment}$appointmentId",
              data: {'cancellation_reason': resone},
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AppointmentCancelPop()));
        getUpcomingAppointments();
        getCancelledAppintments();
        LogController.activityLog(
            'AppointmentService', "cancellAppointment", 'Success');
      }
    } on DioError catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBarWrong(context, e.response!.data.toString());
      LogController.activityLog(
          'AppointmentService', "cancellAppointment", 'Failed');
    }
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
    } on DioError catch (_) {
      LogController.activityLog(
          'ClinicDetailsService', "getClinicDetails", 'Failed');
    }
  }
}
