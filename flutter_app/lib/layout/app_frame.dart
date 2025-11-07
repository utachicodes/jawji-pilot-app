import 'package:flutter/material.dart';

/// Centers the app content and constrains the max width so it always
/// looks like a phone, even on web/desktop.
class AppFrame extends StatelessWidget {
  final Widget child;
  const AppFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      // Clamp text scale to avoid oversized typography on desktop/web
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1.0),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: child,
        ),
      ),
    );
  }
}

