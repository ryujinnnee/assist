import 'package:chat/home.dart';
import 'package:chat/page/addjadwal.dart';
import 'package:chat/page/do.dart';
import 'package:chat/page/inJadwal.dart';
import 'package:chat/page/notip.dart';
import 'package:chat/page/setting.dart';
import 'package:chat/page/todo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assist',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Home(),
      ),
      initialRoute: "/",
      routes: {
     //   "/home": (context) => const Home(),
    //    "/setting": (context) => const Setting(),
        // "/jadwal": (context) => const Jadwal(),
        // "/addjadwal": (context) => const Addjadwal(),
        // "/injadwal": (context) => const Jadwal(),
        // "/todo": (context) => const Todo(),
        Home.routeName: (context) => const Home(),
        Setting.routeName: (contex) => const Setting(),
        Addjadwal.routeName: (context) => const Addjadwal(),
        Jadwal.routeName: (context) => const Jadwal(),
        Todo.routeName: (context) => const Todo(),
        Do.routeName: (context) => const Do(),
        Notip.routeName: (context) => const Notip(),
      },
    );
  }
}
