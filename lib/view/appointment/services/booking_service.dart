import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/slote_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingService extends ChangeNotifier {
  DateTime _selectdDate = DateTime.now();
  DateTime get selectdDate => _selectdDate;
  Dio dio = Dio();
  List<SloteModel>? slotes;

  void onDateChanged(DateTime date) {
    _selectdDate = date;
    notifyListeners();
    print(selectdDate.day);
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
}
