import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Todo {
  String title;
  bool isDone;
  Todo(this.title, {this.isDone = false});
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  var ref = FirebaseFirestore.instance.collection("todos");

  List<Todo> todos = [];

  // ToggleTodoCallback onTodoToggle;

  void fetchTodos() async {
    var getQ = await ref.get(GetOptions(source: Source.server));

    for (var i in getQ.docs) {
      var d = i.data();
      todos.add(Todo(d['title'], isDone: d['isDone']));
    }
    setState(() {
      inspect(todos);
    });
  }

  _toggleTodo(Todo todo, bool? isChecked) {
    setState(() {
      todo.isDone = isChecked == true;
    });
  }

  _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return newTodo(context);
      },
    );

    if (todo != null) {
      setState(() {
        todos.add(todo);

        ref.add({"title": todo.title, "isDone": todo.isDone});
      });
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool? isChecked) {
        _toggleTodo(todo, isChecked);
      },
    );
  }

  Widget buildTodoList(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildItem,
      itemCount: todos.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: buildTodoList(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTodo,
      ),
    );
  }
}

Widget newTodo(BuildContext context) {
  final controller = TextEditingController();
  return AlertDialog(
    title: Text('New todo'),
    content: TextField(
      controller: controller,
      autofocus: true,
    ),
    actions: <Widget>[
      TextButton(
        child: Text('Cancel'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      TextButton(
        child: Text('Add'),
        onPressed: () {
          final todo = Todo(controller.value.text);
          controller.clear();

          Navigator.of(context).pop(todo);
        },
      ),
    ],
  );
}
