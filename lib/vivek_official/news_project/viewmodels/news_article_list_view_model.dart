import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/vivek_official/news_project/repository/news_artical_repository.dart';
import 'package:flutter_sample/vivek_official/news_project/services/api_response.dart';

import '../models/news_article.dart';
import '../services/web_service.dart';
import '../viewmodels/news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = [];

  final NewsArticalRepository _newsArticalRepository = NewsArticalRepository();
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response {
    return _apiResponse;
  }

  void topHeadlinesByCountry(String country) async {
    // loadingStatus = LoadingStatus.searching;
    // notifyListeners();

    // List<NewsArticle> newsArticles =
    //     await WebService().fetchHeadlinesByCountry(country);

    // articles = newsArticles
    //     .map((article) => NewsArticleViewModel(article: article))
    //     .toList();

    // if (articles.isEmpty) {
    //   loadingStatus = LoadingStatus.empty;
    // } else {
    //   loadingStatus = LoadingStatus.completed;
    // }
    // notifyListeners();
    _apiResponse = ApiResponse.loading('Fetching Latest News..');
    // notifyListeners();
    try {
      List<NewsArticle> newsArticles =
          await _newsArticalRepository.fetchHeadlinesByCountry(country);
      _apiResponse = ApiResponse.completed(newsArticles);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        _apiResponse = ApiResponse.error('No Internet Connection');
      } else {
        _apiResponse = ApiResponse.error(e.message);
      }
      print(e);
    }
    notifyListeners();
  }

  void topHeadlines() async {
    _apiResponse = ApiResponse.loading('Fetching Latest News..');
    await Future.delayed(Duration(seconds: 10));
    // notifyListeners();
    try {
      List<NewsArticle> newsArticles =
          await _newsArticalRepository.fetchTopHeadlines();
      _apiResponse = ApiResponse.completed(newsArticles);
    } on DioError catch (e) {
      if (e.error is SocketException) {
        _apiResponse = ApiResponse.error('No Internet Connection');
      } else {
        _apiResponse = ApiResponse.error(e.message);
      }
      print(e);
    }
    notifyListeners();
  }
}
