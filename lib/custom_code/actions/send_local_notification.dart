// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

Future<void> sendLocalNotification(
    String title,
    String body,
    int id, // Unique ID for the notification
    String? payload,
    DateTime? notificationTime) async {
  tz.initializeTimeZones();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialization should have been done elsewhere, so we skip it here.
  // Assuming initialization is complete and plugin is ready.

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id', // Replace with your channel ID
    'your_channel_name', // Replace with your channel name
    channelDescription:
        'your channel description', // Replace with your channel description
    importance: Importance.max,
    priority: Priority.high,
    showWhen: true,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  if (notificationTime == null) {
    // Corrected variable name
    // Show immediate notification
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  } else {
    // Schedule notification

    tz.initializeTimeZones();
    final location = tz.getLocation(DateTime.now()
        .timeZoneName); // Replace with your timezone (e.g., 'America/New_York')

    tz.TZDateTime scheduledDate = tz.TZDateTime.from(
        notificationTime, location); // Corrected variable name

    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledDate,
        platformChannelSpecifics,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
        payload: payload,
        androidScheduleMode:
            AndroidScheduleMode.exactAllowWhileIdle, // Added line
      );
    } catch (e) {
      print("Error scheduling notification: $e");
    }
  }
}
