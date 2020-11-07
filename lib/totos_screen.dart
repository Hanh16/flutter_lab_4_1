import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/models/todo_model.dart';
import 'package:flutter_lab_4_1/todo_screen.dart';

class TodosScreen extends StatelessWidget {
  final todos = List<Todo>.generate(
    20,
    (i) => Todo(
      'Todo $i',
      'A description of what needs to be done for Todo $i',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

