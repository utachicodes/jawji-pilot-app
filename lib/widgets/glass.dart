import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color borderColor;
  final Color? glassColor; // override base tint

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.borderRadius = 14,
    this.borderColor = const Color(0x1AFFFFFF),
    this.glassColor,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: glassColor ?? Colors.black.withOpacity(0.35),
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

