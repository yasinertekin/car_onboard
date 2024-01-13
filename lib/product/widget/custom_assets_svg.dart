import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// [CustomAssetsSvg] is a widget that displays an SVG asset.
final class CustomAssetsSvg extends StatelessWidget {
  /// [CustomAssetsSvg] constructor.
  const CustomAssetsSvg({
    required this.path,
    super.key,
    this.fit = BoxFit.cover,
  });

  /// SVG path.
  final String path;

  /// BoxFit.
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: fit,
    );
  }
}
