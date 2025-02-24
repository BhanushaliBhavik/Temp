// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class ImageWithLoader extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  // Constructor to receive the image URL and optional width/height
  ImageWithLoader({
    required this.imageUrl,
    this.width,
    this.height,
  });

  @override
  State<ImageWithLoader> createState() => _ImageWithLoaderState();
}

class _ImageWithLoaderState extends State<ImageWithLoader> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width ?? 200, // Default width if none provided
        height: widget.height ?? 200, // Default height if none provided
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                // Displaying a loading indicator while the image loads
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder: (context, error, stackTrace) {
                // If an error occurs while loading the image, display a placeholder
                return Center(child: Icon(Icons.error));
              },
            ),
          ],
        ),
      ),
    );
  }
}
