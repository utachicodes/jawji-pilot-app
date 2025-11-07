import 'package:flutter/material.dart';
import '../../widgets/brand_app_bar.dart';
import '../../widgets/gradient_bg.dart';
import '../../widgets/status_chip.dart';

class DroneDetailsScreen extends StatelessWidget {
  const DroneDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const BrandAppBar(title: 'Drone Details', centerTitle: true),
      body: GradientBg(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Text('DRONE 3D', style: theme.textTheme.displayLarge?.copyWith(color: Colors.white12)),
                ),
              ),
              const SizedBox(height: 16),
              Text('SkyGlider M2', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: const [
                  StatusChip(icon: Icons.timer, label: 'Flight Time 35m'),
                  StatusChip(icon: Icons.sd_storage, label: 'Memory 145/512GB'),
                  StatusChip(icon: Icons.wb_cloudy, label: 'Weather Cloudy'),
                  StatusChip(icon: Icons.unfold_more_double, label: 'Max Range 800m'),
                ],
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Camera Detail'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Video Detail'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

