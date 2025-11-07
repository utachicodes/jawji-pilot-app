import 'package:flutter/material.dart';
import '../../widgets/brand_app_bar.dart';

class OperatorDashboardScreen extends StatelessWidget {
  const OperatorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const BrandAppBar(title: 'Operator Dashboard'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Today', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text('4 0.00', style: theme.textTheme.headlineSmall),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Completed', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                        const SizedBox(height: 4),
                        Text('0', style: theme.textTheme.headlineSmall),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 16),
            SwitchListTile(
              value: true,
              onChanged: (_) {},
              title: const Text('Available'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.list), label: const Text('View Available Requests')),
          ],
        ),
      ),
    );
  }
}

