import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'NewsModel.dart';

class NewsProvider extends ChangeNotifier {
  List<Article>? _articles;
  List<Article>? _trendingArticles;
  bool enableLogoutBtn = false;

  enableButton() {
    enableLogoutBtn = true;
    notifyListeners();
  }

  Future<List<Article>?> getNews() async {
    var dio = Dio();
    var response = await dio.request(
      'https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=bb07a585c5f94d6081bcf2f8084a91ee',
      options: Options(
        method: 'GET',
      ),
    );

    NewsModel? newsModel;
    if (response.statusCode == 200) {
      newsModel = NewsModel.fromJson(response.data);
      print(json.encode(response.data));
    } else {
      newsModel = null;
      print(response.statusMessage);
    }

    if (newsModel != null) {
      notifyListeners();
    }
    return newsModel?.articles;
  }

  List<Article>? get articles => _articles;

  // Trigger data fetching and notify listeners
  Future<void> fetchData() async {
    _articles = await getNews();
    notifyListeners();
  }

  Future<List<Article>?> getTrendingNews() async {
    var dio = Dio();
    var response = await dio.request(
      'https://newsapi.org/v2/top-headlines?apiKey=bb07a585c5f94d6081bcf2f8084a91ee&country=us',
      options: Options(
        method: 'GET',
      ),
    );

    NewsModel? newsModel;
    if (response.statusCode == 200) {
      newsModel = NewsModel.fromJson(response.data);
      print(json.encode(response.data));
    } else {
      newsModel = null;
      print(response.statusMessage);
    }

    if (newsModel != null) {
      notifyListeners();
    }
    return newsModel?.articles;
  }

  List<Article>? get trendingArticles => _trendingArticles;

  // Trigger data fetching and notify listeners
  Future<void> fetchTrendingData() async {
    _trendingArticles = await getTrendingNews();
    notifyListeners();
  }
}
