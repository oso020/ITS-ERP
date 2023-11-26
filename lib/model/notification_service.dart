import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final streamCtlr = StreamController<String>.broadcast();
  final titleCtlr = StreamController<String>.broadcast();
  final bodyCtlr = StreamController<String>.broadcast();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await Firebase.initializeApp();
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen((event) async {});
    FirebaseMessaging.onMessage.listen(_onMessageReceived);

    // Initialize local notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    // Retrieve and print the FCM token
    final fcmToken = await _firebaseMessaging.getToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('fcmToken', fcmToken?? '');
    

    // Set up the background message handler
  }

  Future<void> _onBackgroundMessage(RemoteMessage message) async {
    // Handle FCM message when the app is in the background

    // Display a local notification
    await _showLocalNotification(message);
  }

  void _onMessageReceived(RemoteMessage message) {
    // Handle FCM message when the app is in the foreground
    if (message.data.containsKey('data')) {
      // Handle data message
      streamCtlr.sink.add(message.data['data']);
    }
    if (message.data.containsKey('notification')) {
      // Handle notification message
      streamCtlr.sink.add(message.data['notification']);
    }

    titleCtlr.sink.add(message.notification!.title!);
    bodyCtlr.sink.add(message.notification!.body!);

    // Display a local notification
    _showLocalNotification(message);
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'Your Channel Name',
      'Your Channel Description',
      importance: Importance.max,
      priority: Priority.high,
    );
    NotificationDetails platformChannelSpecifics =
        const NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      message.notification!.title!,
      message.notification!.body!,

      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  void dispose() {
    streamCtlr.close();
    bodyCtlr.close();
    titleCtlr.close();
  }
}
