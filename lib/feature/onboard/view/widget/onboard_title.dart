part of '../onboard_view.dart';

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
            color: ProjectColor.white.color,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
