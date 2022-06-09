import 'package:chat/animation/local_notifications.dart';
import 'package:chat/theme/colorplt.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:chat/notip/notifHandler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotipCenter extends StatefulWidget {
  const NotipCenter({Key? key}) : super(key: key);

  @override
  State<NotipCenter> createState() => _NotipCenterState();
}

class _NotipCenterState extends State<NotipCenter> {
  // FirebaseMessaging fm = FirebaseMessaging();

  // _NotipCenterState() {
  //   fm.configure();
  // }
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  String notificationMsg = "Belum ada notif nih";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationService.initilize();
    
    // flutterLocalNotificationsPlugin.initialize();
    // debugPrint(
    //     "Token ${(await FirebaseMessaging.instance.getToken()).toString()}");

    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        setState(() {
          notificationMsg =
              "${event.notification!.title} ${event.notification!.body} notip dari terminate";
        });
      }
    });

    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.showNotificationOnForeground(event);
      setState(() {
        notificationMsg =
            "${event.notification!.title} ${event.notification!.body} notip dari foreground";
      });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMsg =
            "${event.notification!.title} ${event.notification!.body} notip dari background";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Notif'),
            backgroundColor: primary,
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
            ]),
        body: Center(
          child: Text(notificationMsg), //Text('$notificationMsg')
        ));
  }
}
