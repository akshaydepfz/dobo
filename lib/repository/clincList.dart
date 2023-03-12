import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/models/clincList.dart';

class clincService extends ChangeNotifier {
  List<ClinicList> doctorlist = [];

  Future<List<ClinicList>> getClinicList() async {
    final SharedPreferences accesstoken = await SharedPreferences.getInstance();
    String? token = accesstoken.getString('access');
    print("access token :  $token");
    var response = await http
        .get(Uri.parse('https://dobo.co.in/api/v1/clinics/'), headers: {
      "Authorization": "Bearer $token",
      'Accept': 'application/json',
      // "content-type": "application/json"
    });

    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> data = await json.decode(response.body);
      doctorlist = data.map((dynamic e) => ClinicList.fromJson(e)).toList();
      print(e);

      return doctorlist;
    } else {
      throw 'went worng';
    }
  }
}
