import 'package:flutter/material.dart';

ThemeData buildThemeData() {
  const bg = Color(0xFF0A0A0A);
  const surface = Color(0xFF1A1A1A);
  const primary = Color(0xFF6366F1);
  const success = Color(0xFF10B981);
  const danger = Color(0xFFEF4444);

  final colorScheme = const ColorScheme.dark().copyWith(
    primary: primary,
    secondary: success,
    surface: surface,
    background: bg,
    error: danger,
  );

  return ThemeData(
    colorScheme: colorScheme,
    scaffoldBackgroundColor: bg,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    useMaterial3: true,
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: const Color(0xFF0F0F0F),
      indicatorColor: primary.withOpacity(0.15),
      labelTextStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white70)),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 16),
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      hintStyle: const TextStyle(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    cardTheme: CardThemeData(
      color: surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}

