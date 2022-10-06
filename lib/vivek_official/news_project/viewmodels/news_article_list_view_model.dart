import 'package:flutter/material.dart';

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

  void topHeadlinesByCountry(String country) async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    List<NewsArticle> newsArticles =
        await WebService().fetchHeadlinesByCountry(country);

    articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  void topHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    notifyListeners();

    articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }
}
