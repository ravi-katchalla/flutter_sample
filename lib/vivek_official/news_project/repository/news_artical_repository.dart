// import 'package:dio/dio.dart';
import 'package:flutter_sample/vivek_official/news_project/models/news_article.dart';
import 'package:flutter_sample/vivek_official/news_project/services/web_service.dart';
// import 'package:http/http.dart';

class NewsArticalRepository {
  WebService webService = WebService();

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await webService.fetchTopHeadlines();
    final result = response.data;
    Iterable list = result['articles'];
    return list.map((article) => NewsArticle.fromJson(article)).toList();
  }

  Future<List<NewsArticle>> fetchHeadlinesByCountry(String country) async {
    final response = await webService.fetchHeadlinesByCountry(country);
    final result = response.data;
    Iterable list = result['articles'];
    return list.map((article) => NewsArticle.fromJson(article)).toList();
  }
}
