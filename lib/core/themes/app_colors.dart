import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color primary = Color(0xFF2F6BFF);
  static const Color primaryDark = Color(0xFF1E4FD6);

  static const Color appBarGradientStart = primary;
  static const Color appBarGradientEnd = primaryDark;
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryMuted = Color(0xB3FFFFFF);
  static const Color overlaySubtle = Color(0x1FFFFFFF);
  static const Color overlayStrong = Color(0x33FFFFFF);
  static const Color appBarGlow = Color(0x1AFFFFFF);
  static const Color appBarShadow = Color(0x471E4FD6);

  static const Color genderMale = Color(0xFF4C86E6);
  static const Color genderFemale = Color(0xFFE07FA3);

  static const Color searchHighlightBackground = Color(0xFF9FF0FF);

  static const List<Color> avatarPalette = <Color>[
    Color(0xFF2F6BFF),
    Color(0xFF00A8A8),
    Color(0xFFE8962E),
    Color(0xFF7B4FD8),
    Color(0xFFD3577E),
    Color(0xFF4FA36B),
  ];

  static const Color background = Color(0xFFF7F8FA);
  static const Color backgroundGradientStart = Color(0xFFEDF2FF);
  static const Color backgroundGradientEnd = background;
  static const Color surface = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF1A1D23);
  static const Color textSecondary = Color(0xFF5B6470);
  static const Color onAvatar = Color(0xFFFFFFFF);

  static const Color divider = Color(0xFFE3E6EB);
  static const Color disabled = Color(0xFF9AA3AF);

  static const Color highlightBackground = Color(0xFFEAF0FF);
  static const Color highlightBorder = Color(0xFF2F6BFF);
  static const Color cardShadow = Color(0x14000000);

  static const Color error = Color(0xFFD93A3A);
}
