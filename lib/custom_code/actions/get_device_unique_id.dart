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
import 'dart:math';

import 'package:uuid/uuid.dart';

Future<String> getDeviceUniqueId() async {
  try {
    if (Platform.isAndroid) {
      try {
        final result = await Process.run('settings', ['get', 'android_id']);
        final androidId = result.stdout.toString().trim();

        if (androidId.isNotEmpty && androidId != '9774d56d682e549c') {
          return androidId;
        } else {
          return const Uuid().v4(); // Fallback to UUID
        }
      } catch (e) {
        print('Error getting Android ID: $e');
        return const Uuid().v4(); // Fallback to UUID
      }
    } else if (Platform.isIOS) {
      try {
        final result = await Process.run(
            'ioreg', ['-rd1', '-c', 'IOPlatformExpertDevice']);
        final ioregOutput = result.stdout.toString();
        final serialNumberLine = ioregOutput.split('\n').firstWhere(
            (line) => line.contains('"IOPlatformSerialNumber"'),
            orElse: () => '');

        if (serialNumberLine.isNotEmpty) {
          final serialNumber = serialNumberLine
              .split('=')[1]
              .trim()
              .replaceAll('"', ''); //remove quotes
          return serialNumber;
        } else {
          return const Uuid().v4(); // Fallback to UUID
        }
      } catch (e) {
        print('Error getting iOS/macOS identifier: $e');
        return const Uuid().v4(); // Fallback to UUID
      }
    } else {
      return const Uuid().v4(); // Fallback for other platforms
    }
  } catch (generalError) {
    print('General error getting device ID: $generalError');
    return const Uuid().v4(); // Ultimate fallback
  }
}
