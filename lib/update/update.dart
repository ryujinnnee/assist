import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../providers/todo_providers.dart';
// import '../screens/home_todo.dart';
import '../update/providers/todo_providers.dart';
import '../update/screens/home_todo.dart';

// void main() {
//   runApp(const MyApp());
// }

class StateManag extends StatelessWidget {
  const StateManag({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoListProvider(),
        ),
      ],
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Provider',
     
      home: HomeScreen(),
    ));
  }
}
