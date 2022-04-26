import 'package:chat/home.dart';
import 'package:chat/log/tugas.dart';
//import 'package:chat/login2.dart';
import 'package:chat/masuk.dart';
import 'package:chat/page/addjadwal.dart';
import 'package:chat/page/do.dart';
import 'package:chat/page/inJadwal.dart';
import 'package:chat/page/notip.dart';
import 'package:chat/page/setting.dart';
import 'package:chat/page/todo.dart';
import 'package:chat/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // bool isUser = true;

  // @override
  // void initState() {
  //   super.initState();
  //   _initCheck();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assist',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Splash(), //Home(),
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
        Tugass.routeName: (context) => const Tugass(),
      },
    );
  }

  // void _initCheck() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if(prefs.getBool("isUser") != null){
  //     setState(() {
  //       isUser = prefs.getBool("isUser")!;
  //     });
    
  //   }
  // }
}
