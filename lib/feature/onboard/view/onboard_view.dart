import 'package:car_onboard/feature/onboard/view_model/onboard_cubit.dart';
import 'package:car_onboard/feature/onboard/view_model/onboard_state.dart';
import 'package:car_onboard/product/constants/string_constants.dart';
import 'package:car_onboard/product/enum/project_color.dart';
import 'package:car_onboard/product/model/onboard.dart';
import 'package:car_onboard/product/widget/custom_assets_svg.dart';
import 'package:dots_indicator/dots_indicator.dart'; // Kullandığınız paketin ismi
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widget/custom_indicator.dart';
part 'widget/onboard_app_bar.dart';
part 'widget/onboard_description.dart';
part 'widget/onboard_floating_action_button.dart';
part 'widget/onboard_title.dart';

/// Onboard sayfası.
final class OnboardView extends StatelessWidget {
  /// Onboard Constructor'ı.
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        final cubit = context.read<OnboardCubit>();
        return _OnboardBody(
          cubit: cubit,
          state: state,
        );
      },
    );
  }
}

final class _OnboardBody extends StatelessWidget {
  const _OnboardBody({
    required this.cubit,
    required this.state,
  });

  final OnboardCubit cubit;
  final OnboardState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: state.onboards[state.currentIndex].backgroundColor,
      appBar: const _OnboardAppBar(),
      body: _PageViewBuilder(
        cubit: cubit,
        state: state,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: PageView.builder(
            controller: cubit.pageController,
            onPageChanged: cubit.onPageIndexChanged,
            itemCount: state.onboards.length,
            itemBuilder: (context, index) {
              final onboard = Onboards.list[index];
              return _PageViewBuilderBody(onboard: onboard);
            },
          ),
        ),
        _CustomIndicator(
          state,
        ),
      ],
    );
  }
}

final class _PageViewBuilderBody extends StatelessWidget {
  const _PageViewBuilderBody({
    required this.onboard,
  });

  final Onboard onboard;

  @override
  Widget build(BuildContext context) {
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
    const padding = 8.0;
    return Padding(
      padding: const EdgeInsets.only(
        left: padding,
        bottom: padding,
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
