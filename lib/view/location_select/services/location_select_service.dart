import 'package:dobo/view/signup/services/signup_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationSelectService extends ChangeNotifier {
  String _address = 'Location Fetching....';
  String get address => _address;

  Future<void> getAddressFromLatLong(BuildContext context, lat, long) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(lat, long);
      Placemark place = placeMarks[0];
      _address = "${place.locality}, ${place.subLocality}, ${place.country}";
      notifyListeners();
      print(address);
    } catch (e) {
      showSnackBarWrong(context, e.toString());
    }
  }
}
