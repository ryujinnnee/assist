// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:modul1_pemrograman_mobile/page/main_page.dart';
// import 'package:modul1_pemrograman_mobile/screens/signin_screen.dart';
// import 'package:modul1_pemrograman_mobile/services/local_notifications.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   _DashboardState createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   String notificationMsg = "Waiting for notifications";
//   @override
//   void initState() {  
//     // TODO: implement initState
//     super.initState();
//     LocalNotificationService.initilize();


//     FirebaseMessaging.instance.getInitialMessage().then((event){
//       if(event != null){
//         setState(() {
//           notificationMsg = "${event.notification!.title} ${event.notification!
//               .body} I am coming from terminated state";
//         });
//       }
//     });

//     FirebaseMessaging.onMessage.listen((event) {
//       LocalNotificationService.showNotificationOnForeground(event);
//       setState(() {
//         notificationMsg =
//         "${event.notification!.title} ${event.notification!.body} I am coming from foreground";
//       });
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       setState(() {
//         notificationMsg =
//         "${event.notification!.title} ${event.notification!.body} I am coming from background";
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         backgroundColor: Colors.indigo,
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.logout), onPressed: () {
//             FirebaseAuth.instance.signOut().then((value) {
//               if (kDebugMode) {
//                 print("Signed Out");
//               }
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const SignInScreen()));
//             });
//             },
//           )],
//       ),
//       body: Center(
//           child: Stack(
//             children: [
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30.0),
//                 child: Column(
//                   children: <Widget>[
//                      const Text(
//                     "Selamat Datang",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w800,
//                     ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.all(10),
//                       child: Expanded(
//                         child: InkWell(
//                           highlightColor: Colors.transparent,
//                           splashColor: Colors.transparent,
//                           onTap: (){
//                             Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => const MainPage()));
//                           },
//                           child: Column(
//                             children: <Widget>[
//                               const Image(image: AssetImage("assets/images/doa.png"),
//                               height: 300, width: 300,),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               const Text(
//                                 "Home",
//                                 style: TextStyle(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.bold
//                               ),),
//                               Text(
//                                 notificationMsg,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w800,
//                                 ),),
//                             ],
//                           ),
//                         ),
//                       )
//                     )],),)
//     ),]),));
//   }
// }