import 'package:chat/splash.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:chat/update/providers/todo_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/add_edit_td.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/hometodo';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: const Text('State Management Provider'),
        actions: [
          IconButton(
            icon: const Icon(Icons.login_rounded), //NotipCenter(),
            // onPressed: _logOut,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Splash(),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<TodoListProvider>(
        
        // backgroundColor: Colors.grey[200],
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
                          color: Colors.red.shade200,
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
        backgroundColor: primary,

        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddEditTodoWidget(title: 'Tambah Todo');
              });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
