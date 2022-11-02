import 'package:flutter/material.dart';

import 'a2_2_1_programs_of_the_day/all_program.dart';
import 'a2_2_1_programs_of_the_day/cms_program.dart';
import 'a2_2_1_programs_of_the_day/hospital_program.dart';
import 'a2_2_1_programs_of_the_day/school_program.dart';

/// Day planning widget
class DayPlanning extends StatelessWidget {
  const DayPlanning({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const TabBar(
            tabs: [
              Tab(
                text: "CMS",
              ),
              Tab(
                text: "Hôpital",
              ),
              Tab(
                text: "École",
              ),
              Tab(
                text: "ALL",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CMSProgram(),
            HospitalProgram(),
            SchoolProgram(),
            AllProgram(),
          ],
        ),
      ),
    );
  }
}
