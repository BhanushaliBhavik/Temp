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

import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<String> getDeviceFingerprint() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  Map<String, String> deviceData = {};
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceData = {
      "brand": androidInfo.brand,
      "model": androidInfo.model,
      "androidId": androidInfo.id, // Unique ID
      "hardware": androidInfo.hardware,
      "manufacturer": androidInfo.manufacturer,
    };
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceData = {
      "model": iosInfo.model,
      "identifierForVendor": iosInfo.identifierForVendor ?? "",
      "systemVersion": iosInfo.systemVersion,
      "localizedModel": iosInfo.localizedModel,
    };
    return iosInfo.identifierForVendor ?? "HAHA";
  }
  // Generate hash (fingerprint)
  return generateHash(deviceData);
}

String generateHash(Map<String, String> data) {
  String rawData = jsonEncode(data);
  return sha256.convert(utf8.encode(rawData)).toString(); // Secure hash
}
