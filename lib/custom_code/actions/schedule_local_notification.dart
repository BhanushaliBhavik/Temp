// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart'; // Correct import

Future<void> scheduleLocalNotification(
  String title,
  String body,
  String payload,
) async {
  // Initialize the FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize time zones
  tz.initializeTimeZones();

  // Get the current time zone
  final String currentTimeZone =
      await FlutterTimezone.getLocalTimezone(); // Correct usage
  tz.setLocalLocation(tz.getLocation(currentTimeZone));

  // Define Android notification details
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'your_channel_id', // Replace with your channel ID
    'your_channel_name', // Replace with your channel name
    channelDescription:
        'your_channel_description', // Replace with your channel description
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  // Define notification details
  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  // Schedule the notification
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0, // Notification ID
    title, // Notification title
    body, // Notification body
    tz.TZDateTime.now(tz.local)
        .add(const Duration(seconds: 5)), // Schedule for 5 seconds later
    notificationDetails, // Notification details
    androidScheduleMode:
        AndroidScheduleMode.exactAllowWhileIdle, // Schedule mode
  );
}
