import 'package:flutter/material.dart';
import '../../widgets/brand_app_bar.dart';
import '../../widgets/gradient_bg.dart';

class LiveTrackingScreen extends StatelessWidget {
  const LiveTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const BrandAppBar(title: 'Live Tracking'),
      body: GradientBg(
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flight, size: 64, color: theme.colorScheme.primary),
            const SizedBox(height: 12),
            Text('Telemetry & video placeholder', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
          ],
        ),
      ),
      ),
    );
  }
}

