import 'package:flutter_sample/vivek_official/news_project/models/news_article.dart';
import 'package:intl/intl.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title ?? '';
  }

  String get description {
    return _newsArticle.description ?? '';
  }

  String get imageUrl {
    return _newsArticle.urlToImage ?? '';
  }

  String get url {
    return _newsArticle.url ?? '';
  }

  String get author {
    return _newsArticle.author ?? '';
  }

  String get content {
    return _newsArticle.content ?? '';
  }

  String get publishedAt {
    if (_newsArticle.publishedAt != null) {
      final dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
          .parse(_newsArticle.publishedAt!, true);
      return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
    } else {
      return '';
    }
  }
}
