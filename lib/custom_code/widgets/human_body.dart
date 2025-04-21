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

import 'package:xml/xml.dart';
import 'package:path_drawing/path_drawing.dart';

class HumanBody extends StatefulWidget {
  const HumanBody({
    super.key,
    this.width,
    this.height,
    required this.svg, // now svg String comes here
  });

  final double? width;
  final double? height;
  final String svg;

  @override
  State<HumanBody> createState() => _HumanBodyState();
}

class _HumanBodyState extends State<HumanBody> {
  Map<String, Path> bodyPaths = {};
  String? selectedPart;

  @override
  void initState() {
    super.initState();
    loadRegions();
  }

  Future<void> loadRegions() async {
    try {
      final document = XmlDocument.parse(widget.svg);
      final paths = document.findAllElements('path');

      Map<String, Path> tempPaths = {};

      for (var path in paths) {
        final id = path.getAttribute('id');
        final d = path.getAttribute('d');
        if (id != null && d != null) {
          tempPaths[id] = parseSvgPathData(d);
        }
      }

      setState(() {
        bodyPaths = tempPaths;
      });
    } catch (e) {
      debugPrint('Error parsing SVG: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (bodyPaths.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTapDown: (details) {
        _detectTap(details.localPosition);
      },
      child: CustomPaint(
        size: Size(widget.width ?? 200, widget.height ?? 600),
        painter: _BodyPainter(
          paths: bodyPaths,
          selectedPart: selectedPart,
        ),
      ),
    );
  }

  void _detectTap(Offset localPosition) {
    for (var entry in bodyPaths.entries) {
      final path = entry.value;
      final matrix = Matrix4.identity()
        ..scale((widget.width ?? 200) / 200, (widget.height ?? 600) / 600);
      final transformedPath = path.transform(matrix.storage);
      if (transformedPath.contains(localPosition)) {
        setState(() {
          selectedPart = entry.key;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on: ${entry.key}')),
        );
        break;
      }
    }
  }
}

class _BodyPainter extends CustomPainter {
  final Map<String, Path> paths;
  final String? selectedPart;

  _BodyPainter({required this.paths, this.selectedPart});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.grey.shade300;

    final Paint selectedPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blueAccent;

    final matrix = Matrix4.identity()
      ..scale(size.width / 200, size.height / 600);

    for (var entry in paths.entries) {
      final path = entry.value.transform(matrix.storage);
      canvas.drawPath(path, entry.key == selectedPart ? selectedPaint : paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BodyPainter oldDelegate) {
    return oldDelegate.paths != paths ||
        oldDelegate.selectedPart != selectedPart;
  }
}
