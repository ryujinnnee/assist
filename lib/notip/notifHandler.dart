import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

initializeNotification() async {
  final fcm = FirebaseMessaging.instance;
  final message = await fcm.getInitialMessage();
  if (message != null) {
  final data = message.data;
  debugPrint("bebaas ges $data");
  debugPrint("Token ${(await FirebaseMessaging.instance.getToken()).toString()}");
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
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

void _onMessage(RemoteMessage message) {
  debugPrint("halo ges! ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  debugPrint("halo ges ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

void _onOpened(RemoteMessage message) async {
  final data = message.data;
  debugPrint("do it whatever you want! $data");
}

// final message = await fcm.getInitialMessage();
//   if (message != null) {
//   final data = message.data;
//   debugPrint("bebaas ges $data");
//   // debugPrint("Token ${fcm.currentToken}");
// }
