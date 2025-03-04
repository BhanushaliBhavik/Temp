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

import 'package:device_info_plus/device_info_plus.dart'; // Import device_info_plus
import 'dart:io'; // Import dart:io for Platform checks

Future<String> newCustomAction() async {
  // return the device ID
  // Get the device ID using the device_info package
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = "unknown"; // Default value in case of failure

  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id; // Get the ID for Android
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ??
          "unknown"; // Get the ID for iOS, fallback to "unknown"
    }
  } catch (e) {
    print("Error getting device ID: $e");
    // deviceId remains "unknown"
  }

  return deviceId; // Return the device ID or "unknown"
}
