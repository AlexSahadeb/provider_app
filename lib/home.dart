import 'package:flutter/material.dart';
import 'package:flutter_provider_app/details_page.dart';
import 'package:flutter_provider_app/provider/todo_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoFromProvider = Provider.of<TodoProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailsPage()));
                },
                icon: Icon(Icons.golf_course))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text("Add new List"),
                      content: Column(
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(hintText: "Titile"),
                          ),
                          TextField(
                            controller: descriptionController,
                            decoration:
                                InputDecoration(hintText: "Description"),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                final title = titleController.text;
                                final description = descriptionController.text;
                                todoFromProvider.addNewTodo(title, description);
                                Navigator.pop(context);
                              },
                              child: Text("Add"))
                        ],
                      ),
                    ));
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todoFromProvider.todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todoFromProvider.todos[index].title),
              subtitle: Text(todoFromProvider.todos[index].description),
              trailing: IconButton(
                  onPressed: () {
                    todoFromProvider.deletTodo(index);
                  },
                  icon: Icon(Icons.arrow_right)),
            );
          },
        ),
      ),
    );
  }
}
