import 'package:flutter/material.dart';

/// Project color enum
enum ProjectColor {
  /// White color
  white,

  /// Transparent color
  transparent,

  /// White with opacity color
  whiteOpacity,

  /// Fresh straw color
  colorFreshStraw,

  /// Winter spring lilac color
  colorWinterSpringLilac,

  /// Chili dip color
  colorChiliDip,

  /// Truesky gloxym color
  colorTrueskyGloxym
}

/// Project color extension
extension ProjectColorExtension on ProjectColor {
  /// Convert [ProjectColor] to [Color]
  Color get color {
    switch (this) {
      case ProjectColor.white:
        return Colors.white;
      case ProjectColor.transparent:
        return Colors.transparent;
      case ProjectColor.whiteOpacity:
        return Colors.white.withOpacity(0.5);
      case ProjectColor.colorFreshStraw:
        return const Color(0xFFf0cf69);
      case ProjectColor.colorWinterSpringLilac:
        return const Color(0xFFb7abfd);
      case ProjectColor.colorChiliDip:
        return const Color(0xFFefb491);
      case ProjectColor.colorTrueskyGloxym:
        return const Color(0xFFb7abfd);
    }
  }
}
