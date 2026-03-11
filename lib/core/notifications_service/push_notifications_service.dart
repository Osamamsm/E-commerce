import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static final messaging = FirebaseMessaging.instance;

  static Future init() async {
    await messaging.requestPermission();

    final String? token = await messaging.getToken();
    log(token ?? "No token");

    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
  }

  static Future<void> handleBackGroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
  }
}
