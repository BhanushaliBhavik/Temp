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

import 'package:flutter/services.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:xml/xml.dart';

class HumanBodyNew extends StatefulWidget {
  const HumanBodyNew({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<HumanBodyNew> createState() => _HumanBodyNewState();
}

class _HumanBodyNewState extends State<HumanBodyNew> {
  List<Region> regions = [];
  Region? selectedRegion;

  @override
  void initState() {
    super.initState();
    loadRegions().then((data) {
      regions = data;
      setState(() {});
    });
  }

  loadRegions() async {
    const path = 'assets/images/labeled_human_body.svg';
    final content = await rootBundle.loadString(path);
    final document = XmlDocument.parse(content);
    final paths = document.findAllElements("path");
    final regions = <Region>[];
    for (var element in paths) {
      final partId = element.getAttribute('id') ?? '';
      if (partId.isEmpty) {
        continue;
      }
      final partPath = element.getAttribute('d').toString();
      regions.add(Region(id: partId, path: partPath));
    }
    return regions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
          maxScale: 5,
          minScale: 1,
          boundaryMargin: EdgeInsets.all(16),
          child: Stack(
            children: [
              for (final region in regions) ...[
                _getRegionBorder(region),
                _getRegionImage(
                    region,
                    selectedRegion?.id == region.id
                        ? Colors.green
                        : Colors.grey)
              ],
            ],
          )),
    );
  }

  Widget _getRegionImage(Region region, [Color color = Colors.grey]) {
    return ClipPath(
      clipper: RegionClipper(svgPath: region.path),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRegion = region;
          });
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  Widget _getRegionBorder(Region region) {
    return CustomPaint(
      painter: RegionBorderPainter(path: parseSvgPathData(region.path)),
    );
  }
}

class Region {
  final String id;
  final String path;

  Region({required this.id, required this.path});
}

class RegionClipper extends CustomClipper<Path> {
  final String svgPath;

  RegionClipper({super.reclip, required this.svgPath});
  @override
  Path getClip(Size size) {
    final path = parseSvgPathData(svgPath);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RegionBorderPainter extends CustomPainter {
  final Path path;
  late final Paint borderPaint;
  RegionBorderPainter({super.repaint, required this.path}) {
    borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5
      ..color = Colors.black;
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
