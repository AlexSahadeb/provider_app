import 'package:flutter/foundation.dart';
import 'package:flutter_provider_app/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [];

  addNewTodo(title, description) {
    var addNew = Todo(title: title, description: description);
    todos.add(addNew);
    notifyListeners();
  }

  deletTodo(index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
