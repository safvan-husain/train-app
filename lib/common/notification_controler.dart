import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/services/auth_services.dart';

class NotificationController {
  static Future<void> initilize() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      AuthServices.updateFirebaseToken(
        token: newToken,
        email: UserController.instance.user.value?.email,
        phone: UserController.instance.user.value?.phone,
      );
    });

    FirebaseMessaging.onMessage.listen((r) {
      _firebaseForeGroundMessageHandler(r);
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen((event) {});
  }
}

Future<void> _firebaseForeGroundMessageHandler(RemoteMessage message) async {
  if (message.notification != null) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      FlutterLocalNotificationsPlugin().show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'fcm_default_channel', // id
              'Messages', // title

              // other properties...
            ),
          ),
          payload: message.data['channel'] ?? "");
    }
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}
