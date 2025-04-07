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

class NetworkImageWithLoading extends StatefulWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double borderRadius;

  const NetworkImageWithLoading({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    required this.borderRadius,
  }) : super(key: key);

  @override
  _NetworkImageWithLoadingState createState() =>
      _NetworkImageWithLoadingState();
}

class _NetworkImageWithLoadingState extends State<NetworkImageWithLoading>
    with TickerProviderStateMixin {
  // Static placeholder and error widgets (now using Components)
  final TransformationController _transformationController =
      TransformationController();
  Animation<Matrix4>? _animationReset;
  late final AnimationController _controllerReset;

  void _onAnimateReset() {
    _transformationController.value = _animationReset!.value;
    if (!_controllerReset.isAnimating) {
      _animationReset!.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset.reset();
    }
  }

  void _animateResetInitialize() {
    _controllerReset.reset();
    _animationReset = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset);
    _animationReset!.addListener(_onAnimateReset);
    _controllerReset.forward();
  }

  // Stop a running reset to home transform animation.
  void _animateResetStop() {
    _controllerReset.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    // If the user tries to cause a transformation while the reset animation is
    // running, cancel the reset animation.
    if (_controllerReset.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controllerReset.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  static final Widget _defaultPlaceholder = const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              Color(0xFFb22F72)), // Set the color here
        ),
      ],
    ),
  );

  static final Widget _defaultErrorWidget = const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error, color: Colors.red, size: 32),
        SizedBox(height: 8),
        Text("Image failed to load", style: TextStyle(color: Colors.red)),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
          widget.borderRadius), // Use widget to access properties
      child: InteractiveViewer(
        panEnabled: true, // Enable zooming and panning
        transformationController: _transformationController,
        boundaryMargin: const EdgeInsets.all(20),
        minScale: 0.5, // Minimum zoom level
        maxScale: 4.0, // Maximum zoom level
        onInteractionStart: _onInteractionStart,
        child: Image.network(
          widget.imageUrl,
          height: widget.height,
          width: widget.width,
          fit: BoxFit.scaleDown, // Set BoxFit to scale down
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
        ),
      ),
    );
  }
}
