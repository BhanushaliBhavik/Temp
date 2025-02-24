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

import 'package:contacts_service/contacts_service.dart';

Future<ContactDetailStruct?> getContactDetail() async {
  // take the user selected contact from real mobile and return the contact detail

  // Get the selected contact from real mobile
  Contact? selectedContact = await ContactsService.openDeviceContactPicker();

  if (selectedContact != null) {
    // Extract the contact details
    String name = selectedContact.displayName ?? "";
    String phoneNumber = selectedContact.phones!.isNotEmpty
        ? selectedContact.phones!.first.value ?? ""
        : "";
    String email = selectedContact.emails!.isNotEmpty
        ? selectedContact.emails!.first.value ?? ""
        : "";
    final contactDetails = ContactDetailStruct(
      name: name,
      phoneNumber: phoneNumber,
      email: email,
    );

    // Create a ContactDetailStruct object with the extracted details

    return contactDetails;
  } else {
    return null;
  }
}
