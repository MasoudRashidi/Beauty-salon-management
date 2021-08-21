import 'package:flutter/material.dart';

abstract class ColorService {
  static final MaterialColor _primary = MaterialColor(0xFF6E46E6, <int, Color>{
    0: const Color(0xFFFFFFFF),
    50: const Color(0xFFF5F2FF),
    100: const Color(0xFFC6B3FF),
    200: const Color(0xFF6E46E6),
    300: const Color(0xFF6E46E6),
    400: const Color(0xFF6E46E6),
    500: const Color(0xFF6E46E6),
    600: const Color(0xFF6E46E6),
    700: const Color(0xFF6E46E6),
    800: const Color(0xFF6E46E6),
    900: const Color(0xFF5536B3),
  });

  static final MaterialColor _secondary =
      MaterialColor(0xFFFFFFFF, <int, Color>{
    0: const Color(0xFFFFFFFF),
    50: const Color(0xFFF4F5F6),
    100: const Color(0xFFDDE1E4),
    200: const Color(0xFF99A3AD),
    300: const Color(0xFF8E99A4),
    350: const Color(0xff6e6e6e),
    400: const Color(0xFF5E6A75),
    500: const Color(0xFF121517),
    900: const Color(0xff000000)
  });

  static final MaterialColor _accent = MaterialColor(0xFFF86E45, <int, Color>{
    200: const Color(0xFFffefeb),
    400: const Color(0xFFFA9475),
    500: const Color(0xFFF86E45),
    900: const Color(0xfffb1b3b),
  });

  static MaterialColor _primaryDark;
  static MaterialColor _secondaryDark;
  static MaterialColor _accentDark;

  static ThemeMode mode = ThemeMode.light;

  // # Main colors

  static MaterialColor get primary =>
      mode == ThemeMode.light ? _primary : _primaryDark;
  static MaterialColor get secondary =>
      mode == ThemeMode.light ? _secondary : _secondaryDark;
  static MaterialColor get accent =>
      mode == ThemeMode.light ? _accent : _accentDark;

  // # Derived colors
  static Color get confirm => accent.shade200;
  static Color get disabled => secondary.shade100;
  static Color get selected => primary;
  static Color get hint => secondary.shade200;
  static Color get error => const Color(0xFFFF7084);
  static Color get remove => const Color(0xFFFB1B3B);
  static Color get success => primary; //const Color(0xFF23DC3D);
}
