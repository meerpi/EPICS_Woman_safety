import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatelessWidget {
  const FlutterFlowIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.borderRadius = 20,
    this.buttonSize = 40,
    this.fillColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 1,
  });

  final Icon icon;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double buttonSize;
  final Color? fillColor;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: buttonSize * 0.6,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
