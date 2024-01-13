import 'package:car_onboard/product/enum/onboard_image.dart';
import 'package:car_onboard/product/enum/project_color.dart';
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

@immutable

/// Onboards
final class Onboards {
  const Onboards._();

  /// List of onboards
  static List<Onboard> list = [
    Onboard(
      floatingActionButtonIcon: OnboardImage.imgLoader1.path,
      backgroundColor: ProjectColor.colorFreshStraw.color,
      title: "Your first car without\na driver's license",
      description: 'Goes to meet people who just got\ntheir license',
      image: OnboardImage.imgCar1.path,
    ),
    Onboard(
      floatingActionButtonIcon: OnboardImage.imgLoader2.path,
      backgroundColor: ProjectColor.colorWinterSpringLilac.color,
      title: 'Always there: more than\n1000 cars in Tbilisi',
      description:
          'Our company is a leader by the\nnumber of cars in the fleet',
      image: OnboardImage.imgCar2.path,
    ),
    Onboard(
      floatingActionButtonIcon: OnboardImage.imgLoader3.path,
      backgroundColor: ProjectColor.colorChiliDip.color,
      title: 'Do not pay for parking,\nmaintenance and gasoline',
      description: 'We will pay for you,all expenses\nrelated to the car',
      image: OnboardImage.imgCar3.path,
    ),
    Onboard(
      floatingActionButtonIcon: OnboardImage.imgLoader4.path,
      backgroundColor: ProjectColor.colorTrueskyGloxym.color,
      title: '29 car models: from Skoda\nOctavia to Porsche 911',
      description: 'Choose between regular car models\nor exclusive ones',
      image: OnboardImage.imgCar4.path,
    ),
  ];
}
