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

import 'dart:io';

Future makeChangesInAndroidMenifest() async {
  // Add your function code here!
  addPermissionsAndComponentsToManifest();
}

void addPermissionsAndComponentsToManifest() {
  final permissions = [
    '<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>',
    '<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>',
    '<uses-permission android:name="android.permission.USE_EXACT_ALARM"/>',
  ];

  final activity = '''
    <activity
      android:showWhenLocked="true"
      android:turnScreenOn="true">
    </activity>
  ''';

  final receivers = [
    '<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver"/>',
    '''
    <receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
      <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
        <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
        <action android:name="android.intent.action.QUICKBOOT_POWERON"/>
        <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
      </intent-filter>
    </receiver>
    ''',
    '<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver"/>',
  ];

  final service = '''
    <service
      android:name="com.dexterous.flutterlocalnotifications.ForegroundService"
      android:exported="false"
      android:stopWithTask="false"
      android:foregroundServiceType="location"/>
  ''';

  final manifestContent = StringBuffer()
    ..writeln('<manifest>')
    ..writeln(permissions.join('\n'))
    ..writeln('<application>')
    ..writeln(activity)
    ..writeln(receivers.join('\n'))
    ..writeln(service)
    ..writeln('</application>')
    ..writeln('</manifest>');
}
