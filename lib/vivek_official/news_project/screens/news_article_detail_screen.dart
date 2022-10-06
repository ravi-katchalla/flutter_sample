import 'package:flutter/material.dart';

import '../viewmodels/news_article_view_model.dart';
import '../widgets/circle_image.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  const NewsArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpeg'),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 200,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Author',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    article.author,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  alignment: Alignment.centerLeft,
                  children: const <Widget>[
                    Divider(
                      height: 80,
                      color: Color(0xffFF8A30),
                      thickness: 20,
                    ),
                    Text(
                      ' Headline',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  article.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    wordSpacing: 3,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  article.publishedAt,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 200,
                  child: CircleImage(
                    imageUrl: article.imageUrl,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  article.description,
                  style: const TextStyle(
                    fontSize: 16,
                    wordSpacing: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
