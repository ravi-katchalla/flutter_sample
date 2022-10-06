import 'package:flutter/material.dart';
import 'package:flutter_sample/vivek_official/screens/sample_api/sample_fetch_list.dart';
import 'package:flutter_sample/vivek_official/screens/sample_api/sample_form.dart';

class HomeApi extends StatefulWidget {
  const HomeApi({Key? key}) : super(key: key);

  @override
  State<HomeApi> createState() => _HomeApiState();
}

class _HomeApiState extends State<HomeApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Api Home')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UserInputForm.routname);
              },
              child: const Text('Post Api'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(SampleListDataScreen.routname);
              },
              child: const Text('Get Api'),
            ),
          ],
        ),
      ),
    );
  }
}
