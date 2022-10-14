import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sample/ravi/todoApp/todoHome.dart';
import 'package:flutter_sample/ravi/todoApp/todoModel.dart';


class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoModel>(
      create: (context) => TodoModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text("To-doApp"),
          ),
          body: TodoHome(),
        ),
      ),
    );
  }
}