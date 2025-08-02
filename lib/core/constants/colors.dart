import "package:flutter/material.dart";

class AppColor {
  static Color primary = _isLight ? _LightTheme.primary : _DarkTheme.primary;
  static Color surface = _isLight ? _LightTheme.surface : _DarkTheme.surface;
  static Color background = _isLight
      ? _LightTheme.background
      : _DarkTheme.background;
  static Color text = _isLight
      ? _LightTheme.onBackground
      : _DarkTheme.onBackground;
  static Color textContrast = !_isLight
      ? _LightTheme.onBackground
      : _DarkTheme.onBackground;
}

// Tema Claro
class _LightTheme {
  static const primary = Color(0xFF1976D2);
  static const background = Color(0xFFF1F8FF);
  static const surface = Color(0xFFE3F2FD);
  static const onBackground = Color(0xFF1A1B23);
}

// Tema Oscuro
class _DarkTheme {
  static const primary = Color(0xFF6A4C93);
  static const background = Color(0xFF1A1425);
  static const surface = Color(0xFF2A1F3D);
  static const onBackground = Color(0xFFF8FAFC);
}

bool _isLight = DateTime.now().hour < 18 && DateTime.now().hour > 6;
