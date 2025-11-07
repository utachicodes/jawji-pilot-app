import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isAuthenticated;
  final String? userRole; // 'client' | 'operator'

  const AuthState({required this.isAuthenticated, required this.userRole});

  AuthState copyWith({bool? isAuthenticated, String? userRole}) => AuthState(
        isAuthenticated: isAuthenticated ?? this.isAuthenticated,
        userRole: userRole ?? this.userRole,
      );
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState(isAuthenticated: false, userRole: null));

  Future<void> login(String email, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    state = state.copyWith(isAuthenticated: true, userRole: 'client');
  }

  Future<void> register(String email, String password, String name) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    state = state.copyWith(isAuthenticated: true, userRole: 'client');
  }

  void selectRole(String role) {
    state = state.copyWith(userRole: role);
  }

  void logout() {
    state = const AuthState(isAuthenticated: false, userRole: null);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

