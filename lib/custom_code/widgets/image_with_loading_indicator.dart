// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:image_fade/image_fade.dart';

class ImageWithLoadingIndicator extends StatefulWidget {
  const ImageWithLoadingIndicator({
    super.key,
    this.width,
    this.height,
    required this.url,
    required this.borderRadius,
  });

  final double? width;
  final double? height;
  final String url;
  final double borderRadius;

  @override
  State<ImageWithLoadingIndicator> createState() =>
      _ImageWithLoadingIndicatorState();
}

class _ImageWithLoadingIndicatorState extends State<ImageWithLoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return ImageFade(
      // whenever the image changes, it will be loaded, and then faded in:
      image: NetworkImage(widget.url),

      // slow fade for newly loaded images:
      duration: const Duration(milliseconds: 900),

      // if the image is loaded synchronously (ex. from memory), fade in faster:
      syncDuration: const Duration(milliseconds: 150),

      // supports most properties of Image:
      alignment: Alignment.center,
      fit: BoxFit.cover,

      // shown behind everything:
      placeholder: Container(
        color: const Color(0xFFCFCDCA),
        alignment: Alignment.center,
        child: const Icon(Icons.photo, color: Colors.white30, size: 128.0),
      ),

      // shows progress while loading an image:
      loadingBuilder: (context, progress, chunkEvent) =>
          Center(child: CircularProgressIndicator(value: progress)),

      // displayed when an error occurs:
      errorBuilder: (context, error) => Container(
        color: const Color(0xFF6F6D6A),
        alignment: Alignment.center,
        child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
      ),
    );
  }
}
