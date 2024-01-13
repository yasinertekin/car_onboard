part of '../onboard_view.dart';

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
            color: ProjectColor.white.color,
          ),
    );
  }
}
