import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_sample/vivek_official/providers/data_provider.dart';

class SampleListDataScreen extends StatefulWidget {
  SampleListDataScreen({Key? key}) : super(key: key);

  static const routname = '/fetch';
  // final List<String> list = [];

  @override
  State<SampleListDataScreen> createState() => _SampleListDataScreenState();
}

class _SampleListDataScreenState extends State<SampleListDataScreen> {
  late Future _getDataFuture;

  Future _getDataFutureObject() {
    return Provider.of<DataProvider>(context, listen: false).getData();
  }

  @override
  void initState() {
    _getDataFuture = _getDataFutureObject();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Data')),
      body: FutureBuilder(
        future: _getDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.error != null) {
              return const Center(
                child: Text('Something went wrong.'),
              );
            } else {
              // return ListView(
              //   children: widget.list.map((item) {
              //     return ListTile(
              //       title: Text(item),
              //     );
              //   }).toList(),
              // );
              return Consumer<DataProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () => print(index),
                        title: Text(value.list[index]),
                      );
                    },
                  );
                },
              );
            }
          }
        },
      ),
    );
  }

  // Future<void> fetchListData() async {
  //   final response = await http.get(
  //     Uri.parse(
  //       'https://flutter-sample-14f43-default-rtdb.firebaseio.com/data.json',
  //     ),
  //   );
  //   print(response.body);
  //   final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
  //   extractedData.forEach((key, value) {
  //     widget.list.add(value['title']);
  //   });
  // }
}
