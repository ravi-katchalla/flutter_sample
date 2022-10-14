import 'package:flutter/material.dart';
import 'package:flutter_sample/ravi/todoApp/todoModel.dart';
import 'package:provider/provider.dart';

class TodoHome extends StatelessWidget {

  final TextEditingController t1 = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    TodoModel todos = Provider.of<TodoModel>(context);
    return Container(
      child: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                  itemCount: todos.allTasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todos.allTasks[index].taskTitle),
                      trailing: TextButton(
                          onPressed: () {
                            todos.deleteTask(todos.allTasks[index]);
                          },
                          child: Text("Remove")),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                children: [
                  Flexible(
                      child: TextField(
                    controller: t1,
                    decoration: InputDecoration(
                      hintText: 'Enter Task Name'
                    )
                  )),
                  ElevatedButton(
                    onPressed: () {
                      todos.addTask(Task(taskTitle: t1.text));
                      t1.clear();
                    },
                    child: Text("Add Task"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}