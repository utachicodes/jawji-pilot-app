import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../state/auth_state.dart';
import '../../widgets/brand.dart';
import '../../widgets/gradient_bg.dart';

class RoleSelectionScreen extends ConsumerWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void select(String role) {
      ref.read(authProvider.notifier).selectRole(role);
      if (role == 'client') {
        context.go('/client');
      } else {
        context.go('/operator');
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Choose Your Role'), centerTitle: true),
      body: GradientBg(
        child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 8),
            const BrandLogo(size: 48),
            const SizedBox(height: 16),
            _RoleCard(title: "I'm a Client", subtitle: 'Request drone deliveries', emoji: '📦', onTap: () => select('client')),
            const SizedBox(height: 16),
            _RoleCard(title: "I'm an Operator", subtitle: 'Pilot drones and earn', emoji: '🚁', onTap: () => select('operator')),
          ],
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String emoji;
  final VoidCallback onTap;

  const _RoleCard({required this.title, required this.subtitle, required this.emoji, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(color: theme.colorScheme.surface, borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 6),
                  Text(subtitle, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey)),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

