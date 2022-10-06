import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  List<String> _list = [];

  List<String> get list {
    return [..._list];
  }

  void addItem(String item) {
    http
        .post(
      Uri.parse(
        'https://flutter-sample-14f43-default-rtdb.firebaseio.com/data.json',
      ),
      body: json.encode({'title': item}),
    )
        .then((value) {
      _list.add(item);
    }).catchError((error) {});
    // print(response.body);
  }

  Future<void> getData() async {
    final response = await http.get(
      Uri.parse(
        'https://flutter-sample-14f43-default-rtdb.firebaseio.com/data.json',
      ),
    );
    print(response.body);
    final List<String> localList = [];
    final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
    extractedData.forEach((key, value) {
      localList.add(value['title']);
    });
    _list = localList;
  }
}
