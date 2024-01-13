import 'package:car_onboard/product/model/onboard.dart';

/// Onboard sayfasının State'i.
final class OnboardState {
  /// Onboard sayfasının Constructor'ı.
  const OnboardState({
    required this.onboards,
    required this.currentIndex,
  });

  /// onboards listesi.
  final List<Onboard> onboards;

  /// currentIndex.
  final int currentIndex;

  /// Onboard sayfasının kopyasını döndürür.
  OnboardState copyWith({
    List<Onboard>? onboards,
    int? currentIndex,
  }) {
    return OnboardState(
      onboards: onboards ?? this.onboards,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
