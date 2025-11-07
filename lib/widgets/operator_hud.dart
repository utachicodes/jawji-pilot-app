import 'package:flutter/material.dart';
import 'glass.dart';

class OperatorHudBar extends StatelessWidget {
  final int battery; // %
  final int gps; // 0..100
  final int latencyMs;
  final bool autoPilot;
  const OperatorHudBar({super.key, required this.battery, required this.gps, required this.latencyMs, required this.autoPilot});

  Color _latency(int ms) {
    if (ms < 100) return Colors.greenAccent;
    if (ms < 200) return Colors.orangeAccent;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GlassCard(
      glassColor: Colors.white.withOpacity(0.35),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const Icon(Icons.satellite_alt, color: Colors.white70, size: 18),
            const SizedBox(width: 6),
            Text('GPS $gps%', style: theme.textTheme.bodyMedium),
          ]),
          Row(children: [
            const Icon(Icons.settings_remote, color: Colors.white70, size: 18),
            const SizedBox(width: 6),
            Icon(Icons.circle, color: _latency(latencyMs), size: 10),
            const SizedBox(width: 6),
            Text('${latencyMs}ms', style: theme.textTheme.bodyMedium),
          ]),
          Row(children: [
            const Icon(Icons.battery_full, color: Colors.white70, size: 18),
            const SizedBox(width: 6),
            Text('$battery%', style: theme.textTheme.bodyMedium),
          ]),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: autoPilot ? Colors.green.withOpacity(0.2) : Colors.blueGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(autoPilot ? 'AUTO' : 'MANUAL', style: theme.textTheme.labelLarge),
          ),
        ],
      ),
    );
  }
}

