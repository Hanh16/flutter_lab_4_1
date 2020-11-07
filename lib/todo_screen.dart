import 'package:flutter/material.dart';
import 'package:flutter_lab_4_1/models/todo_model.dart';

class TodoScreen extends StatelessWidget {
  final Todo todo;

  TodoScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
