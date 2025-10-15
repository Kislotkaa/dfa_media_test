import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedbackWidget extends StatefulWidget {
  final Widget child;
  final double scalePattern;
  final bool isEnabled;
  final bool withHapticFeedback;

  const FeedbackWidget({
    super.key,
    required this.child,
    this.scalePattern = 0.8,
    this.isEnabled = true,
    this.withHapticFeedback = false,
  });

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  bool isPressed = false;

  void _onTapDown() => setState(() => isPressed = true);

  void _onTapUp() {
    setState(() => isPressed = false);
    if (widget.withHapticFeedback) HapticFeedback.mediumImpact();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isEnabled) {
      return widget.child;
    }

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (details) => _onTapDown(),
      onPointerUp: (details) => _onTapUp(),
      onPointerCancel: (details) => _onTapUp(),
      child: AnimatedScale(
        duration: Durations.short3,
        curve: Curves.easeOut,
        scale: isPressed ? widget.scalePattern : 1,
        child: widget.child,
      ),
    );
  }
}
