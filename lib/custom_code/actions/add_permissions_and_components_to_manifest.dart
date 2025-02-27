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

Future<void> addPermissionsAndComponentsToManifest() async {
  final manifestPath = 'android/app/src/main/AndroidManifest.xml';
  final manifestFile = File(manifestPath);

  // Check if the AndroidManifest.xml file exists
  if (!await manifestFile.exists()) {
    print('AndroidManifest.xml not found at $manifestPath');
    return;
  }

  // Read the existing content of the AndroidManifest.xml
  String content = await manifestFile.readAsString();

  // Define the new content to add
  String newContent = '''
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />
<uses-permission android:name="android.permission.USE_EXACT_ALARM" />

<activity
    android:name=".MainActivity"
    android:exported="true"
    android:launchMode="singleTop"
    android:theme="@style/LaunchTheme"
    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
    android:hardwareAccelerated="true"
    android:windowSoftInputMode="adjustResize"
    android:showWhenLocked="true"
    android:turnScreenOn="true">
    <meta-data
      android:name="io.flutter.embedding.android.NormalTheme"
      android:resource="@style/NormalTheme"
      />
    <meta-data
      android:name="io.flutter.embedding.android.SplashScreenDrawable"
      android:resource="@drawable/launch_background"
      />
    <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>
    <meta-data android:name="flutter_deeplinking_enabled" android:value="true" />
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="test" android:host="test.com" />
    </intent-filter>
</activity>

<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver" />
<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED"/>
        <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
        <action android:name="android.intent.action.QUICKBOOT_POWERON" />
        <action android:name="com.htc.intent.action.QUICKBOOT_POWERON"/>
    </intent-filter>
</receiver>
<receiver android:exported="false" android:name="com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver" />
<service
    android:name="com.dexterous.flutterlocalnotifications.ForegroundService"
    android:exported="false"
    android:stopWithTask="false"
    android:foregroundServiceType="location" />
''';

  // Check if the new content already exists to avoid duplication
  if (content.contains(newContent)) {
    print('The specified content already exists in AndroidManifest.xml.');
    return;
  }

  // Insert the new content before the closing </application> tag
  final updatedContent = content.replaceFirst(
    '</application>',
    '$newContent\n</application>',
  );

  // Write the updated content back to the AndroidManifest.xml
  await manifestFile.writeAsString(updatedContent);
  print('AndroidManifest.xml has been updated successfully.');
}
