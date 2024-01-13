part of '../onboard_view.dart';

final class _CustomIndicator extends StatelessWidget {
  const _CustomIndicator(
    this.state,
  );

  final OnboardState state;

  @override
  Widget build(BuildContext context) {
    const padding = 10.0;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Row(
        children: [
          Column(
            children: [
              DotsIndicator(
                position: state.currentIndex,
                dotsCount: state.onboards.length,
                decorator: DotsDecorator(
                  activeColor: ProjectColor.white.color,
                  color: ProjectColor.whiteOpacity.color,
                  activeSize: const Size(18, 9),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const _IndicatorText(),
            ],
          ),
          const Spacer(),
          _OnboardFloatingActionButton(
            cubit: context.read<OnboardCubit>(),
            state: state,
          ),
        ],
      ),
    );
  }
}

final class _IndicatorText extends StatelessWidget {
  const _IndicatorText();

  @override
  Widget build(BuildContext context) {
    return Text(
      StringConstants.skip,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: ProjectColor.white.color,
          ),
    );
  }
}
