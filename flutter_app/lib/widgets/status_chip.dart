import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  const StatusChip({super.key, required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: (color ?? Colors.white.withOpacity(0.08)),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.white70),
          const SizedBox(width: 6),
          Text(label, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}

