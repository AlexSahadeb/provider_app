import 'package:flutter/material.dart';
import 'package:flutter_provider_app/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoFrom = Provider.of<TodoProvider>(context);
    return Scaffold(
        body: Center(
      child: Text("Todo Leath:${todoFrom.todos.length}"),
    ));
  }
}
