import 'package:e_commerce/core/notifications_service/local_notifications_service.dart';
import 'package:e_commerce/core/preferences/user_preferences_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PushNotificationsService {
  static final messaging = FirebaseMessaging.instance;
  final UserPreferencesHelper _preferencesHelper;

  PushNotificationsService(this._preferencesHelper);

  static Future init() async {
    await messaging.requestPermission();

    await messaging.getToken().then((token) {
      sendTokenToServer(token!);
    });

    messaging.unsubscribeFromTopic('promotions');

    messaging.onTokenRefresh.listen((token) {
      sendTokenToServer(token);
    });

    FirebaseMessaging.onBackgroundMessage(handleBackGroundMessage);
    FirebaseMessaging.onMessage.listen(handleForeGroundMessage);
  }

  static Future<void> handleBackGroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  static void handleForeGroundMessage(RemoteMessage message) {
    LocalNotificationsService.showBasicNotification(message);
  }

  void subscribeToTopic(String topic) {
    messaging.subscribeToTopic(topic);
    _preferencesHelper.setTopicSubscription(topic, true);
  }

  void unsubscribeFromTopic(String topic) {
    messaging.unsubscribeFromTopic(topic);
    _preferencesHelper.setTopicSubscription(topic, false);
  }

  bool isSubscribedToTopic(String topic) {
    return _preferencesHelper.getTopicSubscription(topic);
  }

  //TODO : handle the token sending to database
  static void sendTokenToServer(String token) {}
}
