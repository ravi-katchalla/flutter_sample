import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample/vivek_official/chat_sample_app/chat_screen.dart';
import 'package:flutter_sample/vivek_official/stream_sample/stream_api.dart';

class MyApp3 extends StatelessWidget {
  const MyApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streams',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;
  int _timer = 20;
  final StreamController<int> _streamController = StreamController();
  late Stream<int> _stream;
  @override
  void initState() {
    _stream = _streamController.stream.asBroadcastStream();
    super.initState();
  }

  Stream<int> _countValue(Stream<int> stream) async* {
    int sum = 0;
    await for (final value in stream) {
      sum += value;
    }
    yield sum;
    print(sum);
  }

  @override
  Widget build(BuildContext context) {
    return _CounterStream();
  }

  Widget _broadcastStreams() {
    return Scaffold(
      appBar: AppBar(title: const Text('Streams')),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<int>(
                  stream: _stream,
                  builder: (context, snapshot) {
                    int? data = snapshot.data;
                    return Text(
                      'Sum is $data',
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    );
                  }),
              StreamBuilder<int>(
                  stream: _stream,
                  builder: (context, snapshot) {
                    int? data = snapshot.data;
                    return Text(
                      'Sum is $data',
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  _counter += 1;
                  _streamController.sink.add(_counter);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                  backgroundColor: Colors.grey,
                ),
                child: const Text(
                  'Add 1',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              TextButton(
                onPressed: () {
                  _counter += 2;
                  _streamController.sink.add(_counter);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                  backgroundColor: Colors.grey,
                ),
                child: const Text(
                  'Add 2',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              TextButton(
                onPressed: () {
                  _counter += 3;
                  _streamController.sink.add(_counter);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                  backgroundColor: Colors.grey,
                ),
                child: const Text(
                  'Add 3',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              TextButton(
                onPressed: () {
                  _counter += 4;
                  _streamController.sink.add(_counter);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                  backgroundColor: Colors.grey,
                ),
                child: const Text(
                  'Add 4',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              TextButton(
                onPressed: () {
                  _counter += 5;
                  _streamController.sink.add(_counter);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.pink,
                  backgroundColor: Colors.grey,
                ),
                child: const Text(
                  'Add 5',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _counter++;
                    _streamController.sink.add(_counter);
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }

  Widget _singleStreams() {
    return Scaffold(
      appBar: AppBar(title: const Text('Streams')),
      body: SafeArea(
        child: StreamBuilder<Object>(
          stream: _streamController.stream,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Sum is $_counter',
                    style: const TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      _counter += 1;
                      _streamController.sink.add(_counter);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.pink,
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      _counter += 2;
                      _streamController.sink.add(_counter);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.pink,
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      '2',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      _counter += 3;
                      _streamController.sink.add(_counter);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.pink,
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      _counter += 4;
                      _streamController.sink.add(_counter);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.pink,
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      '4',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      _counter += 5;
                      _streamController.sink.add(_counter);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.pink,
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text(
                      '5',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _counter++;
                        _streamController.sink.add(_counter);
                      },
                      child: const Text('Submit'))
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _CounterStream() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                initialData: _timer,
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  return Text('${snapshot.data}',
                      style: const TextStyle(color: Colors.red, fontSize: 30));
                }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // start the timer
                  StartTimer();
                },
                child: const Text(
                  'Start',
                ))
          ],
        ),
      ),
    );
  }

  void StartTimer() async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _timer--;
      _streamController.sink.add(_timer);
      if (_timer <= 0) {
        timer.cancel();
        _streamController.close();
      }
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
