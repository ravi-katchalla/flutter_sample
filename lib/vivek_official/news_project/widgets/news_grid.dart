import 'package:flutter/material.dart';
import 'package:flutter_sample/vivek_official/news_project/models/news_article.dart';
import 'package:flutter_sample/vivek_official/news_project/widgets/circle_image.dart';

import '../screens/news_article_detail_screen.dart';
// import '../viewmodels/news_article_view_model.dart';

class NewsGrid extends StatelessWidget {
  // final List<NewsArticleViewModel> articles;
  final List<NewsArticle> articles;

  const NewsGrid({required this.articles});

  void _showNewsArticleDetails(BuildContext context, NewsArticle vm) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailScreen(
        article: vm,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: articles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? 2
                  : 3),
      itemBuilder: (BuildContext _, int index) {
        final article = articles[index];

        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: CircleImage(
                imageUrl: article.urlToImage ?? '',
              ),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Text(
                article.title ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}
