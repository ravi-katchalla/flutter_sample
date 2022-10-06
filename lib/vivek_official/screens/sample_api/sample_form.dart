import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_sample/vivek_official/providers/data_provider.dart';

class UserInputForm extends StatefulWidget {
  const UserInputForm({Key? key}) : super(key: key);

  static const routname = '/post';

  @override
  State<UserInputForm> createState() => _UserInputFormState();
}

class _UserInputFormState extends State<UserInputForm> {
  final _controller = TextEditingController();

  void saveForm() {
    Provider.of<DataProvider>(context, listen: false).addItem(_controller.text);
    // final response = http.post(
    //   Uri.parse(
    //     'https://flutter-sample-14f43-default-rtdb.firebaseio.com/data.json',
    //   ),
    //   body: json.encode({'title': _controller.text}),
    // );
    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Data')),
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(label: Text('Title')),
              controller: _controller,
            ),
            TextButton(
              onPressed: saveForm,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
