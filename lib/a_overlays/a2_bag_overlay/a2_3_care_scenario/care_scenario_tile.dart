import 'package:flutter/material.dart';
import 'package:pixelarticons/pixel.dart';

import 'heading_scenario_model.dart';

/// Care situation tile widget
class CareSituationTile extends StatelessWidget {
  const CareSituationTile(
      {required this.scenario, required this.onTap, super.key});

  final VoidCallback onTap;
  final CareScenarioHeadingModel scenario;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(scenario.title),
      subtitle: Text(scenario.subtitle),
      trailing: const Icon(Pixel.arrowbarright),
      enabled: true,
      onTap: onTap,
    );
  }
}
