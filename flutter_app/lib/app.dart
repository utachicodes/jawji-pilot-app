import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';
import 'theme.dart';
import 'state/auth_state.dart';
import 'layout/app_frame.dart';

class JawjiApp extends ConsumerWidget {
  const JawjiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(authProvider.select((a) => a.isAuthenticated));
    final role = ref.watch(authProvider.select((a) => a.userRole));

    final router = createRouter(isAuthenticated: isAuthenticated, role: role);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: MaterialApp.router(
        title: 'JAWJI Pilot',
        debugShowCheckedModeBanner: false,
        theme: buildThemeData(),
        routerConfig: router,
        builder: (context, child) => AppFrame(child: child!),
      ),
    );
  }
}

