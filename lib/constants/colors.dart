import 'package:flutter/material.dart';

class AppColors {
  static final MaterialColor mainColor = const MaterialColor(
    0xFF162447,
    const <int, Color>{
      50: const Color(0xFF84EFEF),
      100: const Color(0xFF84EFEF),
      200: const Color(0xFF84EFEF),
      300: const Color(0xFF84EFEF),
      400: const Color(0xFF84EFEF),
      500: const Color(0xFF84EFEF),
      600: const Color(0xFF84EFEF),
      700: const Color(0xFF84EFEF),
      800: const Color(0xFF84EFEF),
      900: const Color(0xFF84EFEF),
    },
  );

  //static const PrimaryColor = Color(0xFF0C4B8D);
  static const primaryColor = Color(0xFF84EFEF);

  static const Color yellow = Color(0xFFEEC415);
  static const Color green = Color(0xFF61BF33);
  static const Color orange = Color(0xFFE96B1A);
  static const Color red = Color(0xFFDF1919);
  static const Color background = Colors.white24;

  static const Color text_light = Colors.black87;
  static const Color text_dark = Colors.white;

  // Shimmer Colors
  static final Color shimmerBackground = Colors.grey.shade300;
  static final Color shimmerBaseColor = Colors.grey.shade300;
  static final Color shimmerHighlightColor = Colors.grey.shade100;
}