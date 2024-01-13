/// Onboard image enum
enum OnboardImage {
  /// Loader 1
  imgLoader1,

  /// Loader 2
  imgLoader2,

  /// Loader 3
  imgLoader3,

  /// Loader 4
  imgLoader4,

  /// Car 1
  imgCar1,

  /// Car 2
  imgCar2,

  /// Car 3
  imgCar3,

  /// Car 4
  imgCar4,
}

/// Onboard image extension
extension OnboardImageExtension on OnboardImage {
  /// Get file name
  String get fileName {
    switch (this) {
      case OnboardImage.imgLoader1:
        return 'loader1';
      case OnboardImage.imgLoader2:
        return 'loader2';
      case OnboardImage.imgLoader3:
        return 'loader3';
      case OnboardImage.imgLoader4:
        return 'loader4';
      case OnboardImage.imgCar1:
        return 'car1';
      case OnboardImage.imgCar2:
        return 'car2';
      case OnboardImage.imgCar3:
        return 'car3';
      case OnboardImage.imgCar4:
        return 'car4';
    }
  }

  /// Get path
  String get path {
    return 'assets/img_$fileName.svg';
  }
}
