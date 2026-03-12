import 'package:e_commerce/core/notifications_service/local_notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static final messaging = FirebaseMessaging.instance;

  static Future init() async {
    await messaging.requestPermission();

    final String? token = await messaging.getToken();

    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
    FirebaseMessaging.onMessage.listen(handleForeGroundMessage);
  }

  static Future<void> handleBackGroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  static void handleForeGroundMessage(RemoteMessage message) {
    LocalNotificationsService.showBasicNotification(message);
  }
}
