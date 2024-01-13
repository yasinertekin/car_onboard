part of '../onboard_view.dart';

final class _OnboardFloatingActionButton extends StatelessWidget {
  const _OnboardFloatingActionButton({
    required this.cubit,
    required this.state,
  });

  final OnboardCubit cubit;
  final OnboardState state;

  @override
  Widget build(BuildContext context) {
    const highElevation = 0.0;
    const padding = 10.0;
    const elevation = 0.0;
    return Padding(
      padding: const EdgeInsets.only(
        right: padding,
        bottom: padding,
      ),
      child: FloatingActionButton(
        hoverColor: ProjectColor.transparent.color,
        elevation: elevation,
        backgroundColor: ProjectColor.transparent.color,
        splashColor: ProjectColor.transparent.color,
        highlightElevation: highElevation,
        onPressed: cubit.onNext,
        child: CustomAssetsSvg(
          path: state.onboards[state.currentIndex].floatingActionButtonIcon,
        ),
      ),
    );
  }
}
