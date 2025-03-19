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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

class NetworkImageWithLoading extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  // Static placeholder and error widgets (now using Components)
  static final Widget _defaultPlaceholder = const Center(
    child: Column(
      // Example custom placeholder
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 8),
        Text("Loading...", style: TextStyle(fontSize: 12)),
      ],
    ),
  );

  static final Widget _defaultErrorWidget = const Center(
    child: Column(
      // Example custom error widget
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error, color: Colors.red, size: 32),
        SizedBox(height: 8),
        Text("Image failed to load", style: TextStyle(color: Colors.red)),
      ],
    ),
  );

  const NetworkImageWithLoading({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      height: height,
      width: width,
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          child: child,
        );
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return _defaultPlaceholder; // Use the static placeholder
      },
      errorBuilder: (context, object, stackTrace) {
        return _defaultErrorWidget; // Use the static error widget
      },
    );
  }
}
