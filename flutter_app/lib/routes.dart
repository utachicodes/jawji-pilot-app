import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/auth/splash_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/role_selection_screen.dart';
import 'screens/client/client_shell.dart';
import 'screens/operator/operator_shell.dart';

GoRouter createRouter({required bool isAuthenticated, required String? role}) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/role',
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: '/client',
        builder: (context, state) => const ClientShell(),
      ),
      GoRoute(
        path: '/operator',
        builder: (context, state) => const OperatorShell(),
      ),
    ],
    redirect: (context, state) {
      final loc = state.fullPath ?? '/';
      if (!isAuthenticated && (loc.startsWith('/client') || loc.startsWith('/operator'))) {
        return '/login';
      }
      if (isAuthenticated && role != null) {
        if (loc == '/' || loc == '/login' || loc == '/register' || loc == '/role') {
          return role == 'client' ? '/client' : '/operator';
        }
      }
      return null;
    },
  );
}

