import 'package:car_onboard/feature/onboard/view/onboard_view.dart';
import 'package:car_onboard/product/initialize/project_state_initialize.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const ProjectStateInitialize(
      child: _MyApp(),
    ),
  );
}

final class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const OnboardView(),
    );
  }
}
