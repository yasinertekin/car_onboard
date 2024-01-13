import 'package:car_onboard/feature/onboard/view_model/onboard_cubit.dart';
import 'package:car_onboard/feature/onboard/view_model/onboard_state.dart';
import 'package:car_onboard/product/model/onboard.dart';
import 'package:car_onboard/product/widget/custom_assets_svg.dart';
import 'package:dots_indicator/dots_indicator.dart'; // Kullandığınız paketin ismi
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Onboard sayfası.
final class OnboardView extends StatelessWidget {
  /// Onboard Constructor'ı.
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        final cubit = context.read<OnboardCubit>();
        return Scaffold(
          backgroundColor: state.onboards[state.currentIndex].backgroundColor,
          floatingActionButton: _OnboardFloatingActionButton(
            cubit: cubit,
            state: state,
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PageViewBuilder(
                cubit: cubit,
                state: state,
              ),
              _CustomIndicator(
                state,
              ),
            ],
          ),
        );
      },
    );
  }
}

final class _OnboardFloatingActionButton extends StatelessWidget {
  const _OnboardFloatingActionButton({
    required this.cubit,
    required this.state,
  });

  final OnboardCubit cubit;
  final OnboardState state;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightElevation: 0,
      onPressed: cubit.onNext,
      child: CustomAssetsSvg(
        path: state.onboards[state.currentIndex].floatingActionButtonIcon,
      ),
    );
  }
}

final class _CustomIndicator extends StatelessWidget {
  const _CustomIndicator(
    this.state,
  );

  final OnboardState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DotsIndicator(
              position: state.currentIndex,
              dotsCount: state.onboards.length,
              decorator: DotsDecorator(
                activeColor: Colors.white,
                color: Colors.white.withOpacity(0.5),
                activeSize: const Size(18, 9),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 5,
              ),
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _PageViewBuilder extends StatelessWidget {
  const _PageViewBuilder({
    required this.cubit,
    required this.state,
  });

  final OnboardCubit cubit;
  final OnboardState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: PageView.builder(
        controller: cubit.pageController,
        onPageChanged: cubit.onPageIndexChanged,
        itemCount: state.onboards.length,
        itemBuilder: (context, index) {
          final onboard = Onboards.list[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _OnboardTitleAndDescriptionColumn(onboard: onboard),
              CustomAssetsSvg(
                path: onboard.image,
              ),
            ],
          );
        },
      ),
    );
  }
}

final class _OnboardTitleAndDescriptionColumn extends StatelessWidget {
  const _OnboardTitleAndDescriptionColumn({
    required this.onboard,
  });

  final Onboard onboard;

  @override
  Widget build(BuildContext context) {
    const height = 10.0;
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        bottom: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _OnboardTitle(
            onboard: onboard,
          ),
          const SizedBox(
            height: height,
          ),
          _OnboardDescription(
            onboard: onboard,
          ),
        ],
      ),
    );
  }
}

final class _OnboardDescription extends StatelessWidget {
  const _OnboardDescription({
    required this.onboard,
  });

  final Onboard onboard;

  @override
  Widget build(BuildContext context) {
    return Text(
      onboard.description,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
    );
  }
}

final class _OnboardTitle extends StatelessWidget {
  const _OnboardTitle({
    required this.onboard,
  });

  final Onboard onboard;

  @override
  Widget build(BuildContext context) {
    return Text(
      onboard.title,
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}

@immutable

/// Onboards
final class Onboards {
  const Onboards._();

  /// List of onboards
  static List<Onboard> list = [
    Onboard(
      floatingActionButtonIcon: OnboardImage.imgLoader1.path,
      backgroundColor: const Color(0xFFf0cf69),
      title: "Your first car without\na driver's license",
      description: 'Goes to meet people who just got\ntheir license',
      image: OnboardImage.imgCar1.path,
    ),
    Onboard(
      floatingActionButtonIcon: OnboardImage.imgLoader2.path,
      backgroundColor: const Color(0xFFb7abfd),
      title: 'Always there: more than\n1000 cars in Tbilisi',
      description:
          'Our company is a leader by the\nnumber of cars in the fleet',
      image: OnboardImage.imgCar2.path,
    ),
    Onboard(
      floatingActionButtonIcon: OnboardImage.imgLoader3.path,
      backgroundColor: const Color(0xFFefb491),
      title: 'Do not pay for parking,\nmaintenance and gasoline',
      description: 'We will pay for you,all expenses\nrelated to the car',
      image: OnboardImage.imgCar3.path,
    ),
    Onboard(
      floatingActionButtonIcon: OnboardImage.imgLoader4.path,
      backgroundColor: const Color(0xFF95b6ff),
      title: '29 car models: from Skoda\nOctavia to Porsche 911',
      description: 'Choose between regular car models\nor exclusive ones',
      image: OnboardImage.imgCar4.path,
    ),
  ];
}

enum OnboardImage {
  imgLoader1,
  imgLoader2,
  imgLoader3,
  imgLoader4,
  imgCar1,
  imgCar2,
  imgCar3,
  imgCar4,
}

extension OnboardImageExtension on OnboardImage {
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

  String get path {
    return 'assets/img_$fileName.svg';
  }
}
