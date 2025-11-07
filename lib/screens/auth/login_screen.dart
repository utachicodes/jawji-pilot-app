import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../state/auth_state.dart';
import '../../widgets/ui.dart';
import '../../widgets/brand.dart';
import '../../widgets/gradient_bg.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => context.go('/client'),
            child: const Text('Skip', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
      body: SafeArea(
        child: GradientBg(
          child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 8),
              Center(
                child: Column(
                  children: [
                    const BrandLogo(size: 56),
                    const SizedBox(height: 16),
                    Text('Welcome back', style: theme.textTheme.displayLarge?.copyWith(fontSize: 26)),
                    const SizedBox(height: 6),
                    const Text("Let's get you into JAWJI", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              JawjiInput(controller: emailCtrl, hint: 'Your Email'),
              const SizedBox(height: 12),
              JawjiInput(controller: passCtrl, hint: 'Your Password', obscure: true),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: const Text('Forgot password?', style: TextStyle(color: Colors.grey))),
              ),
              const SizedBox(height: 8),
              PrimaryButton(
                label: loading ? 'Signing in…' : 'Sign in',
                onPressed: loading
                    ? () {}
                    : () async {
                        setState(() => loading = true);
                        await ref.read(authProvider.notifier).login(emailCtrl.text, passCtrl.text);
                        setState(() => loading = false);
                        context.go('/role');
                      },
              ),
              const SizedBox(height: 16),
              const OrDivider(),
              const SizedBox(height: 16),
              SecondaryDarkButton(label: 'Sign In With Apple', icon: Icons.apple, onPressed: () {}),
              const SizedBox(height: 12),
              SecondaryDarkButton(label: 'Sign In With Phone', icon: Icons.phone_iphone, onPressed: () {}),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => context.go('/register'),
                child: const Text("Don't have an account?", style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}

