// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart'; // Ensure you import FirebaseAuth

Future<String> loginWith() async {
  // Get the current user
  User? user = FirebaseAuth.instance.currentUser;

  // Check if the user is signed in
  if (user != null) {
    // Check the provider data to determine the sign-in method
    if (user.providerData.isNotEmpty) {
      // Return the provider ID of the first provider
      return user.providerData.first
          .providerId; // This will return the sign-in method (e.g., 'google.com', 'password', etc.)
    } else {
      return 'No provider data available';
    }
  }

  return 'No user signed in';
}
