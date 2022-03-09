import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/Utils/list_objects.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/widgets/average_container.dart';
import 'package:netlyfe/widgets/custom_bp_datatable.dart';
import 'package:netlyfe/widgets/custom_diab_datatable.dart';
import 'package:netlyfe/widgets/custom_diabetes_sheet.dart';
import 'package:netlyfe/widgets/custom_floating_action_btn.dart';
import 'package:netlyfe/widgets/stages_container.dart';

class RecordSugarLevel extends StatefulWidget {
  const RecordSugarLevel({Key? key}) : super(key: key);

  @override
  State<RecordSugarLevel> createState() => _RecordSugarLevelState();
}

class _RecordSugarLevelState extends State<RecordSugarLevel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.primary),
          title: const AppName(
              fontSize: 20, title: 'Record ', span: 'Sugar Level'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AverageContainer(
                    title: "Average Glucose",
                    values: "6.0mg/dl",
                    avgImg: StringData.dbavg),
                AverageContainer(
                    title: "Last Glucose",
                    values: "10.1mg/dl",
                    avgImg: StringData.dbavg),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(diabetStageList.length, (index) {
                    return StagesContainer(
                        stgName: diabetStageList[index].stageName,
                        stgColor: diabetStageList[index].stageColor);
                  })),
            ),
            const SizedBox(height: 25),
            const Text("My Trends",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Colors.black87)),
            const SizedBox(height: 10),
            const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: CustomDiabetesDataTable(),
            )
          ],
        ),
        floatingActionButton: const CustomFloatingButton(
          bottomsheetWidget: CustomDiabetesSheetWidget(),
        ));
  }
}
