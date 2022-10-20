import 'package:flutter/material.dart';
import 'package:flutter_sample/main.dart';
import 'package:flutter_sample/vivek_official/shared_preference/shared_pref_helper.dart';

class MyApp4 extends StatelessWidget {
  const MyApp4({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Pref',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp4Widget(),
    );
  }
}

class MyApp4Widget extends StatefulWidget {
  const MyApp4Widget({super.key});

  @override
  State<MyApp4Widget> createState() => _MyApp4WidgetState();
}

class _MyApp4WidgetState extends State<MyApp4Widget> {
  int _counter = 0;
  String _lan = '';

  @override
  void initState() {
    getValuesFromSharedPreference();
    super.initState();
  }

  void getValuesFromSharedPreference() async {
    _counter = (await SharedPreferenceHelper().getNumber());
    _lan = (await SharedPreferenceHelper().getLanguage());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preference')),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$_counter'),
          Text(_lan),
          ElevatedButton(
              onPressed: (() {
                setState(() {
                  _counter++;
                  _lan = "eng";
                  SharedPreferenceHelper().setNumber(_counter);
                  SharedPreferenceHelper().setLanguage(_lan);
                });
              }),
              child: const Text('Click'))
        ],
      )),
    );
  }
}
