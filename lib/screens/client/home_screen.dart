import 'package:flutter/material.dart';
import '../../widgets/brand_app_bar.dart';
import '../../widgets/gradient_bg.dart';
import '../../widgets/ui.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const BrandAppBar(title: 'Client'),
      body: GradientBg(
        child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFF0F0F0F),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),
              child: Center(
                child: Text('Map placeholder (Google Maps)', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Need a delivery?', style: theme.textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Text('Request a pilot to pick up and drop off your package safely.', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                    const SizedBox(height: 12),
                    PrimaryButton(label: 'Request Delivery', onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Open Request Form')))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

