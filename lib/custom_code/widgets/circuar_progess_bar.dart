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

import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';

class CircuarProgessBar extends StatefulWidget {
  const CircuarProgessBar({
    super.key,
    this.width,
    this.height,
    required this.progress,
    this.tickness,
  });

  final double? width;
  final double? height;
  final double progress; // Progress value between 0 and 100
  final int? tickness; // Thickness of the progress bar

  @override
  State<CircuarProgessBar> createState() => _CircuarProgessBarState();
}

class _CircuarProgessBarState extends State<CircuarProgessBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          DashedCircularProgressBar.aspectRatio(
            aspectRatio: 1, // width ÷ height
            progress: 478,
            maxProgress: 670,
            corners: StrokeCap.butt,
            foregroundColor: Colors.blue,
            backgroundColor: const Color(0xffeeeeee),
            foregroundStrokeWidth: 36,
            backgroundStrokeWidth: 36,
            animation: true,
          ),
        ],
      ),
    );
  }
}
