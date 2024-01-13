part of '../onboard_view.dart';

final class _OnboardAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _OnboardAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColor.transparent.color,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
