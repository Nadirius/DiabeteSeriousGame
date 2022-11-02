import 'package:flutter/material.dart';

import 'care_scenario_model.dart';

/// Scenario details widget
class ScenarioDetails extends StatelessWidget {
  const ScenarioDetails({
    required this.scenarioModel,
    required this.title,
    super.key,
  });

  final CareScenarioModel scenarioModel;
  final String title;

  static Future<void> show({
    required BuildContext context,
    required CareScenarioModel scenarioModel,
    required String title,
  }) async {
    await Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => ScenarioDetails(
          title: title,
          scenarioModel: scenarioModel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ..._getSection("Context :", scenarioModel.careContexte),
                const SizedBox(
                  height: 50,
                ),
                ..._getSection("Objectifs :", scenarioModel.careObjective),
                const SizedBox(
                  height: 50,
                ),
                ..._getSection("Location :", scenarioModel.careLocation),
                const SizedBox(
                  height: 50,
                ),
                ..._getSection("Personnages :", scenarioModel.careCharcters),
                const SizedBox(
                  height: 50,
                ),
                ..._getSection("Bonus - Malus :", scenarioModel.careBonusMalus),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Build the different sections of the scenario
  List<Widget> _getSection(String title, String content) {
    return <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Center(
        child: SizedBox(
          width: 600,
          child: SingleChildScrollView(
            child: Text(
              content,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    ];
  }
}
