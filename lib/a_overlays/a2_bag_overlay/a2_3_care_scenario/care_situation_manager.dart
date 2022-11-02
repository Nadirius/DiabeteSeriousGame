import 'package:flutter/material.dart';

import '../../../z_globals/z3_strings_manager.dart';
import 'care_scenario_model.dart';
import 'care_scenario_tile.dart';
import 'heading_scenario_model.dart';
import 'scenario_details.dart';

/// Care situation widget
class CareSituation extends StatelessWidget {
  CareSituation({super.key});

  final List<CareScenarioHeadingModel> careScenarioHeadingList = [
    CareScenarioHeadingModel(
      title: "CMS - Scenario 1 :",
      subtitle: "Chez Monsieur Moutarde.",
    ),
    CareScenarioHeadingModel(
      title: "CMS - Scenario 2 :",
      subtitle: "Chez Madame Myrtille.",
    ),
    CareScenarioHeadingModel(
      title: "CMS - Scenario 3 :",
      subtitle: "Chez Monsieur Brocoli.",
    ),
    CareScenarioHeadingModel(
      title: "Hôpital - Scenario 4 :",
      subtitle: "Chambre 23 - patient Monsieur Brocoli.",
    ),
    CareScenarioHeadingModel(
      title: "Hôpital - Scenario 5 :",
      subtitle: "Chambre 24 - patient Monsieur Fraiseux.",
    ),
    CareScenarioHeadingModel(
      title: "Hôpital - Scenario 6 :",
      subtitle: "Chambre 25 - patient Monsieur Laitue.",
    ),
    CareScenarioHeadingModel(
      title: "Hôpital - Scenario 7 :",
      subtitle: "Chambre 26 - patient Monsieur Abricot.",
    ),
    CareScenarioHeadingModel(
      title: "École :",
      subtitle: "Salle de conférence - face aux étudiants.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: careScenarioHeadingList.length + 2,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: Colors.black,
      ),
      itemBuilder: (context, index) {
        if (index == 0 || index == careScenarioHeadingList.length + 1) {
          return Container();
        }
        return CareSituationTile(
          onTap: () {
            ScenarioDetails.show(
                context: context,
                title:
                    "${careScenarioHeadingList[index - 1].title} ${careScenarioHeadingList[index - 1].subtitle}",
                scenarioModel: careScenrioModels[index - 1]);
          },
          scenario: careScenarioHeadingList[index - 1],
        );
      },
    );
  }

  final List<CareScenarioModel> careScenrioModels = [
    CareScenarioModel(
      careContexte: GameScenario.scenario1Context,
      careObjective: GameScenario.scenario1Objective,
      careLocation: GameScenario.scenario1Location,
      careCharcters: GameScenario.scenario1Charactere,
      careBonusMalus: GameScenario.scenario1BonusMalus,
    ),
    CareScenarioModel(
      careContexte: GameScenario.scenario2Context,
      careObjective: GameScenario.scenario2Objective,
      careLocation: GameScenario.scenario2Location,
      careCharcters: GameScenario.scenario2Charactere,
      careBonusMalus: GameScenario.scenario2BonusMalus,
    ),
    CareScenarioModel(
      careContexte: GameScenario.scenario3Context,
      careObjective: GameScenario.scenario3Objective,
      careLocation: GameScenario.scenario3Location,
      careCharcters: GameScenario.scenario3Charactere,
      careBonusMalus: GameScenario.scenario3BonusMalus,
    ),
    CareScenarioModel(
      careContexte: GameScenario.scenario4Context,
      careObjective: GameScenario.scenario4Objective,
      careLocation: GameScenario.scenario4Location,
      careCharcters: GameScenario.scenario4Charactere,
      careBonusMalus: GameScenario.scenario4BonusMalus,
    ),
    CareScenarioModel(
      careContexte: GameScenario.scenario5Context,
      careObjective: GameScenario.scenario5Objective,
      careLocation: GameScenario.scenario5Location,
      careCharcters: GameScenario.scenario5Charactere,
      careBonusMalus: GameScenario.scenario5BonusMalus,
    ),
    CareScenarioModel(
      careContexte: GameScenario.scenario6Context,
      careObjective: GameScenario.scenario6Objective,
      careLocation: GameScenario.scenario6Location,
      careCharcters: GameScenario.scenario6Charactere,
      careBonusMalus: GameScenario.scenario6BonusMalus,
    ),
    CareScenarioModel(
      careContexte: GameScenario.scenario7Context,
      careObjective: GameScenario.scenario7Objective,
      careLocation: GameScenario.scenario7Location,
      careCharcters: GameScenario.scenario7Charactere,
      careBonusMalus: GameScenario.scenario7BonusMalus,
    ),
    CareScenarioModel(
      careContexte: GameScenario.scenario8Context,
      careObjective: GameScenario.scenario8Objective,
      careLocation: GameScenario.scenario8Location,
      careCharcters: GameScenario.scenario8Charactere,
      careBonusMalus: GameScenario.scenario8BonusMalus,
    ),
  ];
}
