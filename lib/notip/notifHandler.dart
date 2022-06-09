import 'dart:io';

import 'package:chat/theme/colorplt.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

initializeNotification() async {
  final fcm = FirebaseMessaging.instance;
  final message = await fcm.getInitialMessage();
  if (message != null) {
    final data = message.data;
    debugPrint("bebaas ges $data");
    debugPrint(
        "Token ${(await FirebaseMessaging.instance.getToken()).toString()}");
  }
  try {
    if (Platform.isIOS) {
      await fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      await fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      FirebaseMessaging.onMessage.listen((event) {});
      FirebaseMessaging.onBackgroundMessage((message) async {});
      FirebaseMessaging.onMessageOpenedApp.listen((event) {});
      FirebaseMessaging.onMessage.listen(_onMessage);
      FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_onOpened);

      final message = await fcm.getInitialMessage();
      if (message != null) {
        final data = message.data;
        debugPrint("INIT: $data");
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

void _onMessage(RemoteMessage message) {
  debugPrint("halo ges! ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          // channelId,
          // channelName,
          color: primary,
          playSound: true,
          icon: '@mipmap/launch_image',
        )));
  }
}

// void _onMessage(RemoteMessage message) {
//   debugPrint("halo ges! ${message.notification?.title}");
//   debugPrint("${message.notification?.body}");
// }

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  debugPrint("halo ges ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

void _onOpened(RemoteMessage message) async {
  final data = message.data;
  debugPrint("Openeddd $data");
}

// final message = await fcm.getInitialMessage();
//   if (message != null) {
//   final data = message.data;
//   debugPrint("bebaas ges $data");
//   // debugPrint("Token ${fcm.currentToken}");
// }
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'my_channel',
  'My Channel',
  importance: Importance.high,
);
