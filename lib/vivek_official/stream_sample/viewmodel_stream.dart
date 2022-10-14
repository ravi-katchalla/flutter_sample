import 'dart:async';

import 'package:flutter_sample/vivek_official/news_project/models/news_article.dart';
import 'package:flutter_sample/vivek_official/news_project/repository/news_artical_repository.dart';

class StreamViewModel {
  StreamController<List<NewsArticle>> streamController = StreamController();

  void getNews() async {
    await Future.delayed(const Duration(seconds: 10));
    final response = await NewsArticalRepository().fetchTopHeadlines();
    streamController.sink.add(response);
  }
}
