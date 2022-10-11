import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_sample/vivek_official/news_project/services/app_exception.dart';

import '../models/news_article.dart';
import '../utils/constants.dart';

class WebService {
  var dio = Dio();

  Future<Response<dynamic>> fetchHeadlinesByCountry(String country) async {
    Response<dynamic> responseJson;
    final response = await dio.get(Constants.headlinesFor(country));
    responseJson = returnResponse(response);
    return responseJson;
    // if (response.statusCode == 200) {
    //   final result = response.data;
    //   Iterable list = result['articles'];
    //   return list.map((article) => NewsArticle.fromJson(article)).toList();
    // } else {
    //   throw Exception("Failled to get top news");
    // }
  }

  Future<Response<dynamic>> fetchTopHeadlines() async {
    Response<dynamic> responseJson;
    String url = Constants.TOP_HEADLINES_URL;
    final response = await dio.get(url);
    responseJson = returnResponse(response);
    return responseJson;
    // if (response.statusCode == 200) {
    //   final result = response.data;
    //   Iterable list = result['articles'];
    //   return list.map((article) => NewsArticle.fromJson(article)).toList();
    // } else {
    //   print('failed');
    //   throw Exception("Failled to get top news");
    // }
  }

  Response<dynamic> returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server with status code : ${response.statusCode}');
    }
  }
}
