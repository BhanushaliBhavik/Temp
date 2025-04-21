// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io'; // Import for File manipulation
import 'package:path/path.dart' as path; // Import for path manipulation
import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<FFUploadedFile?> newCustomAction(FFUploadedFile file) async {
  try {
    // Validate the input file
    if (file.name == null || file.bytes == null) {
      print('Invalid FFUploadedFile');
      return null;
    }

    // Write bytes to a temporary file
    final tempDir = Directory.systemTemp;
    final tempFile = File('${tempDir.path}/${file.name}');
    await tempFile.writeAsBytes(file.bytes!);

    // Compress the temporary file
    final result = await FlutterImageCompress.compressWithFile(
      tempFile.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 90,
    );

    // Handle the result
    if (result != null) {
      // Write compressed bytes to a new file
      final compressedFile = File('${tempDir.path}/compressed_${file.name}');
      await compressedFile.writeAsBytes(result);

      // Return compressed file as FFUploadedFile
      return FFUploadedFile(
        name: compressedFile.path.split('/').last,
        bytes: await compressedFile.readAsBytes(),
      );
    } else {
      print('Compression failed: result is null');
      return null;
    }
  } catch (e) {
    print('Error during image compression: $e');
    return null;
  }
}
