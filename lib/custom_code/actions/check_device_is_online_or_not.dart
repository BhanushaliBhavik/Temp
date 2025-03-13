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

import 'package:connectivity_plus/connectivity_plus.dart'; // Import the connectivity_plus package

Future<bool> checkDeviceIsOnlineOrNot() async {
  // Get the current connectivity status
  var connectivityResult = await Connectivity().checkConnectivity();

  // Check the connectivity status
  if (connectivityResult[0] == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    return true;
  } else if (connectivityResult[0] == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    return true;
  } else {
    // No internet connection.
    return false;
  }
}
