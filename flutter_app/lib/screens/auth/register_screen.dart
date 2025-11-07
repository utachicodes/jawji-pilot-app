import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../state/auth_state.dart';
import '../../widgets/ui.dart';
import '../../widgets/gradient_bg.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: GradientBg(
          child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              JawjiInput(controller: nameCtrl, hint: 'Full Name'),
              const SizedBox(height: 12),
              JawjiInput(controller: emailCtrl, hint: 'Email'),
              const SizedBox(height: 12),
              JawjiInput(controller: passCtrl, hint: 'Password', obscure: true),
              const SizedBox(height: 20),
              PrimaryButton(
                label: loading ? 'Creating…' : 'Continue',
                onPressed: loading
                    ? () {}
                    : () async {
                        setState(() => loading = true);
                        await ref.read(authProvider.notifier).register(emailCtrl.text, passCtrl.text, nameCtrl.text);
                        setState(() => loading = false);
                        context.go('/role');
                      },
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}

