import 'package:dobo/router/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService extends ChangeNotifier{
  bool isLoading = false;

  Future<void> logOut(BuildContext context)async{
    final pref = await SharedPreferences.getInstance();
    pref.clear();
Navigator.pushReplacementNamed(context, RouteConstants.signInScreen);

  }

}