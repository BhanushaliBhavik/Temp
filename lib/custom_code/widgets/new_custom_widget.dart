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

class NewCustomWidget extends StatefulWidget {
  const NewCustomWidget({
    super.key,
    this.width,
    this.height,
    required this.totalstep,
    required this.currentstep,
    required this.progress, // 0 to 100
  });

  final double? width;
  final double? height;
  final int totalstep;
  final int currentstep;
  final double progress; // 0–100 percentage

  @override
  State<NewCustomWidget> createState() => _NewCustomWidgetState();
}

class _NewCustomWidgetState extends State<NewCustomWidget> {
  @override
  Widget build(BuildContext context) {
    final double stepHeight = 80.0;
    final double totalHeight = widget.height ?? (widget.totalstep * stepHeight);
    final double paddedHeight = totalHeight - 20; // remove top + bottom padding
    final double progressHeight =
        (widget.progress.clamp(0, 100) / 100) * paddedHeight;

    return SizedBox(
      width: widget.width ?? 60,
      height: totalHeight,
      child: Stack(
        children: [
          // Background vertical line
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),

          // Active progress line
          Positioned(
            top: 10, // top padding
            left: 0,
            right: 0,
            child: SizedBox(
              height: progressHeight,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),

          // Step icons
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.totalstep, (index) {
              final isCompleted = index < widget.currentstep;

              return Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isCompleted ? Colors.teal : Colors.grey[400],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 24,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
