import 'package:car_onboard/feature/onboard/view_model/onboard_state.dart';
import 'package:car_onboard/product/model/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Onboard sayfasının Cubit'i.
final class OnboardCubit extends Cubit<OnboardState> {
  /// Onboard sayfasının Cubit'i.
  OnboardCubit({required List<Onboard> onboards})
      : super(OnboardState(onboards: onboards, currentIndex: 0));

  late final PageController _pageController = PageController();

  /// PageController'ı dışarıya açıyoruz.
  PageController get pageController => _pageController;

  /// PageView'de sayfa değiştiğinde çağırılacak fonksiyon.
  void onPageIndexChanged(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  /// Sayfa değiştirme işlemini gerçekleştirir.
  void onNext() {
    if (state.currentIndex == state.onboards.length - 1) {
      return;
    }

    emit(state.copyWith(currentIndex: state.currentIndex + 1));
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
