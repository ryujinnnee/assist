// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'splash_screen.dart';

// Future<void> backroundHandler(RemoteMessage message) async {
//   if (kDebugMode) {
//     print(" This is message from background");
//   }
//   if (kDebugMode) {
//     print(message.notification!.title);
//   }
//   if (kDebugMode) {
//     print(message.notification!.body);
//   }
// }

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   FirebaseMessaging.onBackgroundMessage(backroundHandler);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         backgroundColor: const Color(0xffF5F6F8),
//         fontFamily: "Avenir",
//       ),
//       title: 'e-Pray',
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreen(),
//     );
//   }
// }