import 'package:dio/dio.dart';
import 'package:dobo/api/api_endpoints.dart';
import 'package:dobo/log/log_controller.dart';
import 'package:dobo/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleService extends ChangeNotifier {
  List<ArticleModel>? articleList;
  List<ArticleModel>? trendingList;

  final dio = Dio();

  Future<void> getArticles() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get(ApiEndpoints.articlList,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        List data = response.data;
        articleList = data.map((json) => ArticleModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog('ArticleService', "getArticles", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog('ArticleService', "getArticles", 'Failed');
    }
  }

  Future<void> getTrendingArticles() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("accessToken") ?? '';
    try {
      final response = await dio.get(ApiEndpoints.trendingArticles,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));

      if (response.statusCode == 200) {
        List data = response.data;
        trendingList = data.map((json) => ArticleModel.fromJson(json)).toList();
        notifyListeners();
        LogController.activityLog(
            'ArticleService', "getTrendingArticles", 'Success');
      }
    } on DioError catch (_) {
      LogController.activityLog(
          'ArticleService', "getTrendingArticles", 'Failed');
    }
  }
}
