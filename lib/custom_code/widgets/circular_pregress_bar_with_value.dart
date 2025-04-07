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

class CircularPregressBarWithValue extends StatefulWidget {
  const CircularPregressBarWithValue({
    super.key,
    this.width,
    this.height,
    required this.progress,
    this.thickness,
  });

  final double? width;
  final double? height;
  final double progress; // Progress value between 0 and 100
  final int? thickness; // Thickness of the progress bar

  @override
  State<CircularPregressBarWithValue> createState() =>
      _CircularPregressBarWithValuerState();
}

class _CircularPregressBarWithValuerState
    extends State<CircularPregressBarWithValue> {
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          DashedCircularProgressBar.aspectRatio(
            aspectRatio: 1, // width ÷ height
            valueNotifier: _valueNotifier,
            progress: widget.progress,
            maxProgress: 1,
            corners: StrokeCap.butt,
            foregroundColor: Colors.blue,
            backgroundColor: const Color(0xffeeeeee),
            foregroundStrokeWidth: 36,
            backgroundStrokeWidth: 36,
            animation: true,
            child: Center(
              child: ValueListenableBuilder(
                valueListenable: _valueNotifier,
                builder: (_, double value, __) => Text(
                  '${(value * 100).toInt()}%',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 60),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
