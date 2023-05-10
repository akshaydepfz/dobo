import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService extends ChangeNotifier {
  final dio = Dio();
  List<NotificationModel>? notificationList;

  Future<void> getNotifications() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get(ApiEndpoints.notifications,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response.statusCode == 200) {
        List data = response.data;
        notificationList =
            data.map((json) => NotificationModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'NotificationService', "getNotifications", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'NotificationService', "getNotifications", 'Failed');
    }
  }
}
