import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/router/app_route_constants.dart';
import 'package:dobo/view/profile_create/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationSelectService extends ChangeNotifier {
  String _address = 'Location Fetching....';
  double? latitude;
  double? longitude;
  String get address => _address;
  Dio dio = Dio();
  Future<void> getAddressFromLatLong(BuildContext context, lat, long) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(lat, long);
      Placemark place = placeMarks[0];
      _address = "${place.locality}, ${place.subLocality} ${place.country}";
      latitude = lat;
      longitude = long;
      notifyListeners();
    } catch (e) {
      showSnackBarWrong(context, e.toString());
    }
  }

  Future<void> setLocation(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    String id = pref.getString('pk') ?? "";

    pref.setString('location', address);
    if (longitude == null && latitude == null) {
      // ignore: use_build_context_synchronously
      showSnackBarWrong(context, 'Please enable location');
    } else {
      try {
        final response = await dio.patch("${ApiEndpoints.locationPatch}$id/",
            data: {
              'city': address,
              "location": "${latitude.toString()},${longitude.toString()}"
            },
            options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              },
            ));
        if (response.statusCode == 200 || response.statusCode == 201) {
          LogController.activityLog(
              'LocationSelectService', "setLocation", 'Success');
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, RouteConstants.landingScreen);
        }
      } on DioError catch (e) {
        LogController.activityLog(
            'LocationSelectService', "setLocation", 'Failed');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, RouteConstants.landingScreen);
        // ignore: use_build_context_synchronously
        showSnackBarWrong(context, e.response.toString());
      }
    }
    // ignore: use_build_context_synchronously
  }
}
