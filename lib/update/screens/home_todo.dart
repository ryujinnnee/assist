import 'package:chat/update/providers/todo_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/add_edit_td.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('State Management Provider'),
      ),
      body: Consumer<TodoListProvider>(
        builder: (
          context,
          todoProvider,
          child,
        ) {
          return ListView(
              padding: const EdgeInsets.all(20.0),
              children: todoProvider.todoList.isNotEmpty
                  ? todoProvider.todoList.map((todo) {
                      return Dismissible(
                        key: Key(todo.id),
                        background: Container(
                          color: Colors.red.shade100,
                          child: const Text(
                            'Hapus',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(todo.todo),
                            trailing: const Icon(Icons.edit),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AddEditTodoWidget(
                                    title: 'Edit Todo',
                                    todo: todo,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        onDismissed: (direction) {
                          // todoProvider.removeTodo(todo);
                          Provider.of<TodoListProvider>(
                            context,
                            listen: false,
                          ).removeTodo(todo);
                        },
                      );
                    }).toList()
                  : [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 100.0,
                        child: const Center(
                          child: Text(
                            "todo list masih kosong",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddEditTodoWidget(title: 'Tambah Todo');
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
