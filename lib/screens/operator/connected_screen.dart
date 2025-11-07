import 'package:flutter/material.dart';
import '../../widgets/brand_app_bar.dart';
import '../../widgets/gradient_bg.dart';
import '../../widgets/status_chip.dart';
import '../../widgets/ui.dart';
import 'active_delivery_screen.dart';

class OperatorConnectedScreen extends StatelessWidget {
  const OperatorConnectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const BrandAppBar(title: 'Connected Device', centerTitle: true),
      body: GradientBg(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    // Drone visual placeholder
                    Positioned.fill(
                      child: Center(
                        child: Text('DRONE', style: theme.textTheme.displayLarge?.copyWith(color: Colors.white12, letterSpacing: 10)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: StatusChip(icon: Icons.battery_full, label: '65%'),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: StatusChip(icon: Icons.security, label: 'Safe'),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: StatusChip(icon: Icons.info_outline, label: 'See Details'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text('SkyGlider M2', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: 'Fly Now',
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ActiveDeliveryScreen())),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: StatusChip(icon: Icons.battery_charging_full, label: '65%')),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Expanded(child: StatusChip(icon: Icons.home_outlined, label: 'Home')),
                  SizedBox(width: 12),
                  Expanded(child: StatusChip(icon: Icons.add, label: 'New')),
                  SizedBox(width: 12),
                  Expanded(child: StatusChip(icon: Icons.person_outline, label: 'Profile')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

