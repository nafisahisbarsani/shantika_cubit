import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:http/http.dart' as http;

import 'constant.dart';

class NotificationManager {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize settings for Android and iOS
  final AndroidInitializationSettings _initializationSettingsAndroid =
      const AndroidInitializationSettings('@drawable/app_icon');
  final DarwinInitializationSettings _initializationSettingsDarwin =
      const DarwinInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
      );

  late InitializationSettings _initializationSettings;

  // Singleton instance
  static NotificationManager? _instance;

  // prevent multiple instances of Notifications
  NotificationManager._() {
    // Initialize settings for both platforms
    _initializationSettings = InitializationSettings(
      android: _initializationSettingsAndroid,
      iOS: _initializationSettingsDarwin,
    );
  }

  // Public method to access the singleton instance
  factory NotificationManager.getInstance() {
    // If the instance doesn't exist, create one; otherwise, return the existing instance
    _instance ??= NotificationManager._();
    return _instance!;
  }

  FlutterLocalNotificationsPlugin get flutterLocalNotificationsPlugin =>
      _flutterLocalNotificationsPlugin;

  InitializationSettings get initializationSettings => _initializationSettings;

  Future<void> showNotification({
    required int id,
    required String channelId,
    required String channelName,
    String? channelDescription,
    required String title,
    required String body,
    required String payload,
    String? imageUrl,
  }) async {
    if (imageUrl != null) {
      final http.Response response = await http.get(
        Uri.parse("$baseImage/$imageUrl"),
      );

      final StyleInformation styleInformation = BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(
          base64Encode(response.bodyBytes),
        ),
      );
      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
            channelId,
            channelName,
            channelDescription: channelDescription,
            importance: Importance.max,
            priority: Priority.max,
            styleInformation: styleInformation,
            ticker: 'ticker',
          );
      DarwinNotificationDetails iOsPlatformChannelSpecifics =
          const DarwinNotificationDetails();
      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOsPlatformChannelSpecifics,
      );

      await _flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        platformChannelSpecifics,
        payload: payload,
      );
    } else {
      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
            channelId,
            channelName,
            channelDescription: channelDescription,
            importance: Importance.max,
            priority: Priority.max,
            ticker: 'ticker',
          );
      DarwinNotificationDetails iOsPlatformChannelSpecifics =
          const DarwinNotificationDetails();
      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOsPlatformChannelSpecifics,
      );

      await _flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        platformChannelSpecifics,
        payload: payload,
      );
    }
  }

  Future<void> showPeriodicNotification({
    required int id,
    required String channelId,
    required String channelName,
    String? channelDescription,
    required String title,
    required String body,
    required String payload,
  }) async {
    // ignore: avoid_print
    print("showPeriodicNotification");

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          channelId,
          channelName,
          channelDescription: channelDescription,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        );
    DarwinNotificationDetails iOsPlatformChannelSpecifics =
        const DarwinNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOsPlatformChannelSpecifics,
    );

    RepeatInterval repeatInterval = RepeatInterval.weekly;

    await _flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      repeatInterval,
      platformChannelSpecifics,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exact,
    );
  }

  Future<void> showScheduleNotification({
    required int id,
    required String channelId,
    required String channelName,
    String? channelDescription,
    required String title,
    required String body,
    required String payload,
    required DateTime dateTime,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          channelId,
          channelName,
          channelDescription: channelDescription,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
        );
    DarwinNotificationDetails iOsPlatformChannelSpecifics =
        const DarwinNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOsPlatformChannelSpecifics,
    );

    tz.initializeTimeZones();
    final tz.Location location = tz.getLocation('Asia/Jakarta');

    tz.TZDateTime scheduledDate = tz.TZDateTime.from(dateTime, location);

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate.toUtc(),
      platformChannelSpecifics,
      payload: payload,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }
}
