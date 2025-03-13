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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<String> newCustomAction() async {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  Map<String, String> deviceData = {};

  String? storedFingerprint;

  if (Platform.isIOS) {
    // Use Keychain storage for iOS
    storedFingerprint = await secureStorage.read(key: 'device_fingerprint');
  } else if (Platform.isAndroid) {
    // Use SharedPreferences for Android
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    storedFingerprint = prefs.getString('device_fingerprint');
  }

  if (storedFingerprint != null) {
    return storedFingerprint; // Return stored fingerprint
  }

  // Fetch device-specific info
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceData = {
      "brand": androidInfo.brand,
      "model": androidInfo.model,
      "androidId": androidInfo.id, // Unique & Persistent unless factory reset
      "hardware": androidInfo.hardware,
      "manufacturer": androidInfo.manufacturer,
    };
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceData = {
      "model": iosInfo.model,
      "identifierForVendor": iosInfo.identifierForVendor ??
          "", // Changes if all apps are uninstalled
      "localizedModel": iosInfo.localizedModel,
    };
  }

  // Generate a persistent hash (fingerprint)
  String fingerprint = generateHash(deviceData);

  // Store the fingerprint securely
  if (Platform.isIOS) {
    await secureStorage.write(key: 'device_fingerprint', value: fingerprint);
  } else if (Platform.isAndroid) {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('device_fingerprint', fingerprint);
  }

  return fingerprint;
}

String generateHash(Map<String, String> data) {
  String rawData = jsonEncode(data);
  return sha256.convert(utf8.encode(rawData)).toString(); // Secure hash
}
