import 'package:car_onboard/feature/onboard/view_model/onboard_cubit.dart';
import 'package:car_onboard/product/model/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// ProjectStateInialize
final class ProjectStateInitialize extends StatelessWidget {
  /// ProjectStateInialize constructor
  const ProjectStateInitialize({
    required this.child,
    super.key,
  });

  /// ProjectStateInialize child
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardCubit(
            onboards: Onboards.list,
          ),
        ),
      ],
      child: child,
    );
  }
}
