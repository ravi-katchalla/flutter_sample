import 'dart:async';

import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final StreamController<int> _streamController = StreamController();
  int _counter = 10;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Wait 10 seconds here then go back'),
              const Text('Here seconds are also updating using stream.'),
              StreamBuilder<int>(
                  initialData: _counter,
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}',
                      style: const TextStyle(color: Colors.red, fontSize: 30),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void startTimer() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter -= 1;
      _streamController.sink.add(_counter);
      if (_counter <= 0) {
        timer.cancel();
        _streamController.close();
      }
    });
  }
}
