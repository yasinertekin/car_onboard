import 'package:flutter/material.dart';

/// [Onboard] modeli.
final class Onboard {
  /// [Onboard] constructor.
  const Onboard({
    required this.title,
    required this.description,
    required this.image,
    required this.backgroundColor,
    required this.floatingActionButtonIcon,
  });

  /// Onboard title.
  final String title;

  /// Onboard description.
  final String description;

  /// Onboard image.
  final String image;

  /// Onboard background color.
  final Color backgroundColor;

  /// Onboard floating action button icon.
  final String floatingActionButtonIcon;
}
