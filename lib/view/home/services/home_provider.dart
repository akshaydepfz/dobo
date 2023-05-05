import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dobo/model/clinic_model.dart';
import 'package:dobo/model/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  final dio = Dio();

  List<ClinicModel> clinicList = [];

  Future getNearestClinics() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response = await dio.get('https://dobo.co.in/api/v1/clinics/',
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        List data = response.data;
        clinicList = data.map((json) => ClinicModel.fromJson(json)).toList();
        print(clinicList.length);
      }
    } on DioError catch (e) {}
  }

  Future getSliders() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';

    try {
      final response =
          await dio.get('https://dobo.co.in/api/v1/patients/sliders/',
              options: Options(headers: {
                'Authorization': 'Bearer $token',
              }));

      if (response.statusCode == 200) {
        List<SliderModel> sliders = [];
        List data = response.data;

        sliders = data.map((e) => SliderModel.fromJson(e)).toList();
        print(sliders[0].title);
      }
    } on DioError catch (e) {}
  }
}
