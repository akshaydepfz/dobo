import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/clinic_model.dart';
import 'package:dobo/model/doctor_model.dart';
import 'package:dobo/model/reminder_model.dart';
import 'package:dobo/model/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  final dio = Dio();
  String _location = 'Select location';
  String get location => _location;
  bool _isFavoriteLoad = false;
  int _favorieIndex = 0;
  int get favorieIndex => _favorieIndex;
  bool get isFavoriteLoad => _isFavoriteLoad;
  List<ClinicModel> clinicList = [];
  List<ClinicModel> popularClinics = [];
  List<SliderModel> sliders = [];
  List<ReminderModel> reminders = [];
  List<DoctorListModel>? doctorList;

  Future<void> getLocation() async {
    final pref = await SharedPreferences.getInstance();
    _location = pref.getString('location') ?? "Select Location ";
    notifyListeners();
  }

  String _latitude = '0';
  String _longitude = '0';

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      _latitude = '${position.latitude}';
      _longitude = '${position.longitude}';
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future getNearestClinics() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get(
          "https://dobo.co.in/api/v1/clinics/clinics/nearest/?location=$_latitude,$_longitude",
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
    } on DioError catch (_) {
      LogController.activityLog(
          'HomeProvider', "getNearestClinics", "Failed  ");
    }
  }

  Future getPopularClinics() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response =
          await dio.get("https://dobo.co.in/api/v1/clinics/clinics/popular/",
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      if (response.statusCode == 200) {
        List data = response.data;
        popularClinics =
            data.map((json) => ClinicModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'HomeProvider', "getPopularClinics", "Success");
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'HomeProvider', "getPopularClinics", "Failed  ");
    }
  }

  Future getSliders() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get('https://dobo.co.in/api/v1/sliders/',
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
      final response = await dio.get('https://dobo.co.in/api/v1/reminders/',
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
        LogController.activityLog('HomeProvider', "getDoctorList", "Sucess");
      }
    } on DioError catch (_) {
      LogController.activityLog('HomeProvider', "getDoctorList", "Failed");
    }
  }

  Future addClinicFavorite(
      BuildContext context, String clinicId, bool isFavorite, int index) async {
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
          _isFavoriteLoad = false;
          notifyListeners();
          LogController.activityLog(
              'HomeProvider', "addClinicFavorite", "Success");
          getNearestClinics();
        }
      } on DioError catch (_) {
        _isFavoriteLoad = false;
        notifyListeners();
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
          _isFavoriteLoad = false;
          notifyListeners();
          LogController.activityLog(
              'HomeProvider', "addClinicFavorite", "Success");
          getNearestClinics();
        }
      } on DioError catch (_) {
        _isFavoriteLoad = false;
        notifyListeners();
        LogController.activityLog(
            'HomeProvider', "addClinicFavorite", "Failed");
      }
    }
  }
}
