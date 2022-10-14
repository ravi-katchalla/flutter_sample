import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpGetEx extends StatefulWidget {
  const HttpGetEx({super.key});

  @override
  State<HttpGetEx> createState() => _HttpGetExState();
}

class _HttpGetExState extends State<HttpGetEx> {

  final String url = "https://swapi.dev/api/films/";
  List data = [];

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
    var a = Uri.encodeFull(url);
    getJsonData(a);
  }

  Future<String> getJsonData(var a) async{
    var response = await http.get(
      // encode url and fetch
      Uri.parse(url),
    //  only accept json response
    headers: {"Accept":"application/json"}
    );
    print(response.body);
    var convertDatatoJson = jsonDecode(response.body);
    data = convertDatatoJson['results'];

    setState(() {
    //  var convertDatatoJson = jsonDecode(response.body);
    //  data = convertDatatoJson['results'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Get Example'),
      ),
      body: data.length == 0 ? Center(child: CircularProgressIndicator()) :
       ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(data[index]['title'], ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        )
        
    );
  }
}