import 'package:chat/google/Logged.dart';
import 'package:chat/google/controller.dart';
import 'package:chat/google/gugelLog.dart';
import 'package:chat/google/signup_widget.dart';
import 'package:chat/home.dart';
import 'package:chat/log/tugas.dart';
import 'package:chat/loginn.dart';
//import 'package:chat/login2.dart';
import 'package:chat/masuk.dart';
import 'package:chat/notip/notipPage.dart';
// import 'package:chat/notip/notifHandler.dart';
import 'package:chat/page/addjadwal.dart';
import 'package:chat/page/do.dart';
import 'package:chat/page/inJadwal.dart';
import 'package:chat/page/notip.dart';
import 'package:chat/page/setting.dart';
import 'package:chat/page/todo.dart';
import 'package:chat/page/ui/ui/screens/beranda.dart';
import 'package:chat/page/ui/ui/screens/tudu.dart';
import 'package:chat/splash.dart';
import 'package:chat/update/providers/todo_providers.dart';
import 'package:chat/update/screens/home_todo.dart';
import 'package:chat/update/update.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notip/notifHandler.dart';

// void main() {
//   runApp(const MyApp());
// }
Future<void> backroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print(" Pesan dari Background");
  }
  if (kDebugMode) {
    print(message.notification!.title);
  }
  if (kDebugMode) {
    print(message.notification!.body);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final prefs = await SharedPreferences.getInstance();
  //    final showboarding = prefs.getBool('showboarding') ?? false;
  await initializeNotification();
  // AuthenticationService service = AuthenticationService(FirebaseAuth.instance);
  // service.getUserData();
  debugPrint(
        "Token nya bang ${(await FirebaseMessaging.instance.getToken()).toString()}");
  FirebaseMessaging.onBackgroundMessage(backroundHandler);
  
  runApp(const MyApp()); //MyApp());StateManag());
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create:  (context) => GoogleSignInprovider(), //TodoListProvider(),  GoogleSignInprovider(),
    child:  MaterialApp(
      title: 'Assist',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Splash(),//HomeScreen(),//MyLogin(),//Splash(), //Home(),
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
        Tuwduh.routeName: (context) => const Tuwduh(),
        BerandaUI.routeName: (context) => const BerandaUI(),
        Notip.routeName: (context) => const Notip(),
        Tugass.routeName: (context) => const Tugass(),
        LoggedInWidget.routeName: (context) => const LoggedInWidget(),
      },
    ),
  );
}
