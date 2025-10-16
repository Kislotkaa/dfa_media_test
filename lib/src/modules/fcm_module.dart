import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FcmModule {
  static FirebaseMessaging? _instance;

  static Future<void> setDeviceInfo() async {
    try {
      final instance = await initFirebaseMessaging();
      final token = await instance?.getToken();
      if (token == null) throw 'token null';

      // Токен на бэк
      
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<FirebaseMessaging?> initFirebaseMessaging() async {
    if (_instance != null) return _instance;
    await Firebase.initializeApp();
    _instance = FirebaseMessaging.instance;
    await _instance?.getNotificationSettings();
    await _instance?.requestPermission();
    await _instance?.setForegroundNotificationPresentationOptions(
      alert: false,
      badge: false,
      sound: false,
    );
    return _instance;
  }

  static void setOnBackgroundMessage(Future<void> Function(RemoteMessage) handler) =>
      FirebaseMessaging.onBackgroundMessage(handler);

  static Future<void> deleteToken() async => await _instance?.deleteToken();
  static Future<void> getToken() async => await _instance?.getToken();

  static List<Stream<dynamic>> getRemoteMessageStreams() {
    Stream<RemoteMessage> onMessageOpenedApp = FirebaseMessaging.onMessageOpenedApp;
    Stream<RemoteMessage> onMessage = FirebaseMessaging.onMessage;
    Stream<String> onToken = FirebaseMessaging.instance.onTokenRefresh;
    return [onMessageOpenedApp, onMessage, onToken];
  }

  static Future<dynamic> getInitialMessage() async {
    return await _instance?.getInitialMessage();
  }
}
