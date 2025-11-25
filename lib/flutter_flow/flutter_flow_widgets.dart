import 'package:flutter/material.dart';
import 'flutter_flow_theme.dart';

class FFButtonWidget extends StatelessWidget {
  const FFButtonWidget({
    super.key,
    required this.onPressed,
    this.text,
    this.icon,
    this.iconData,
    required this.options,
  });

  final VoidCallback? onPressed;
  final String? text;
  final Widget? icon;
  final IconData? iconData;
  final FFButtonOptions options;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: options.color ?? FlutterFlowTheme.of(context).primary,
        foregroundColor: options.textColor ?? Colors.white,
        padding: options.padding ??
            EdgeInsets.symmetric(
              horizontal: options.width ?? 16,
              vertical: options.height ?? 12,
            ),
        elevation: options.elevation ?? 2,
        side: options.borderSide,
        shape: RoundedRectangleBorder(
          borderRadius: options.borderRadius ?? BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (iconData != null)
            Icon(
              iconData,
              color: options.iconColor ?? options.textColor ?? Colors.white,
              size: options.iconSize,
            ),
          if (text != null)
            Padding(
              padding: options.iconPadding ??
                  EdgeInsets.only(
                      left: (icon != null || iconData != null) ? 8 : 0),
              child: Text(
                text!,
                style: options.textStyle ??
                    FlutterFlowTheme.of(context).bodyMedium.override(
                          color: options.textColor ?? Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
              ),
            ),
        ],
      ),
    );
  }
}

class FFButtonOptions {
  const FFButtonOptions({
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.iconPadding,
    this.textStyle,
    this.elevation,
    this.borderSide,
    this.iconColor,
    this.iconSize,
  });

  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? iconPadding;
  final TextStyle? textStyle;
  final double? elevation;
  final BorderSide? borderSide;
  final Color? iconColor;
  final double? iconSize;
}


