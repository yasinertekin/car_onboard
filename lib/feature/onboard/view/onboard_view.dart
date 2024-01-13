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
          floatingActionButton: FloatingActionButton(
            onPressed: cubit.onNext,
            child: const Icon(
              Icons.arrow_forward,
            ),
          ),
          appBar: AppBar(
            title: const Text('OnboardView'),
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

final class _CustomIndicator extends StatelessWidget {
  const _CustomIndicator(
    this.state,
  );

  final OnboardState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DotsIndicator(
            position: state.currentIndex,
            dotsCount: state.onboards.length,
            decorator: DotsDecorator(
              activeSize: const Size(18, 9),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const Text('OnboardView'),
        ],
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
              Text(onboard.title),
              Text(onboard.description),
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

@immutable

/// Onboards
final class Onboards {
  const Onboards._();

  /// List of onboards
  static const List<Onboard> list = [
    Onboard(
      floatingActionButtonIcon: 'assets/img_loader1.svg',
      backgroundColor: Color(0xFFf0cf69),
      title: 'Title 1',
      description: 'Description 1',
      image: 'assets/img_car1.svg',
    ),
    Onboard(
      floatingActionButtonIcon: 'assets/img_loader2.svg',
      backgroundColor: Color(0xFFb7abfd),
      title: 'Title 2',
      description: 'Description 2',
      image: 'assets/img_car2.svg',
    ),
    Onboard(
      floatingActionButtonIcon: 'assets/img_loader3.svg',
      backgroundColor: Color(0xFFefb491),
      title: 'Title 3',
      description: 'Description 3',
      image: 'assets/img_car3.svg',
    ),
    Onboard(
      floatingActionButtonIcon: 'assets/img_loader4.svg',
      backgroundColor: Color(0xFF95b6ff),
      title: 'Title 3',
      description: 'Description 3',
      image: 'assets/img_car4.svg',
    ),
  ];
}
