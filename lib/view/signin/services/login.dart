import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/screens/home_screen.dart';
import '../../landing_page/screens/landing_screen.dart';

Future<void> login(passwordcontroller, gmailcontroller, context) async {
  if (passwordcontroller.text.isNotEmpty && gmailcontroller.text.isNotEmpty) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    var response = await http.post(Uri.parse("https://dobo.co.in/api/token/"),
        body: ({
          "username": gmailcontroller.text,
          "password": passwordcontroller.text
        }));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      SharedPreferences refreshtoken = await SharedPreferences.getInstance();
      await refreshtoken.setString("refresh", body["refresh"]);
      SharedPreferences accesstoken = await SharedPreferences.getInstance();
      await accesstoken.setString("access", body["access"]);

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('access');

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LandingScreen();
      }));
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
    }
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
  }

  return;
}

// void sharedpref(String refresh) async {
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   await pref.setString("login", refresh);
//   Navigator.push(context, MaterialPageRoute(builder: (context) {
//     return HomeScreen();
//   }));
//   print(pref);
// }
