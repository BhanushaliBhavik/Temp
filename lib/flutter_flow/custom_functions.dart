import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';

bool urlIsVideoOrNot(String url) {
  // check the given url is for video or not
  final videoExtensions = [
    '.mp4',
    '.avi',
    '.mov',
    '.mkv',
    '.flv',
    '.wmv',
    '.webm',
    '.mpeg'
  ];
  final videoUrls = videoExtensions.map((ext) => url.endsWith(ext)).toList();
  return videoUrls.contains(true);
}

String newCustomFunction(String email) {
  String body =
      "My account appears to have been disabled. I'd like to re-enable it. My UserID is: $email \n\nWould you please let me know what needs to be done such that the account and app functionality are re-enabled? \n\nThanks.";

  return body;
}

DateTime? newCustomFunction2() {
  DateTime now = DateTime.now();

  // Add one minute to the current time
  DateTime oneMinuteLater = now.add(Duration(minutes: 1));

  return oneMinuteLater;
}

double returnSizeOfMedia(FFUploadedFile? media) {
  // return the size of the uploaded media to two floating point
  double sizeInBytes = media?.bytes?.lengthInBytes?.toDouble() ?? 0.0;
  double sizeInMB = sizeInBytes / (1024 * 1024); // Convert bytes to MB
  return double.parse(sizeInMB.toStringAsFixed(2));
}

bool checkPdfOrNot(FFUploadedFile media) {
  // Check if the file extension is .pdf (case insensitive)
  return media.name!.toLowerCase().endsWith('.pdf');
}
