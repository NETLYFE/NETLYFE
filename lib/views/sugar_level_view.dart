import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/Utils/list_objects.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/controllers/diabetes_controller.dart';
import 'package:netlyfe/models/diabetes.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/views/add_sugar_level.dart';
import 'package:netlyfe/widgets/average_container.dart';
import 'package:netlyfe/widgets/custom_button.dart';
import 'package:netlyfe/widgets/custom_diabetes_sheet.dart';
import 'package:netlyfe/widgets/custom_floating_action_btn.dart';
import 'package:netlyfe/widgets/custom_form_field.dart';
import 'package:netlyfe/widgets/stages_container.dart';

import '../widgets/input_field.dart';

class RecordSugarLevel extends StatefulWidget {
  const RecordSugarLevel({Key? key}) : super(key: key);

  @override
  State<RecordSugarLevel> createState() => _RecordSugarLevelState();
}

class _RecordSugarLevelState extends State<RecordSugarLevel> {
  final diabetesController = Get.put(DiabetesController());
  var log = Logger();

  @override
  void initState() {
    super.initState();
    diabetesController.getAllSugar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColor,
        onPressed: () {
          Get.to(() => const AddSugarLevelPage());
        },
        child: Image.asset("assets/addbp.png", width: 25, height: 25),
      ),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        iconTheme: IconThemeData(color: context.theme.primaryColor),
        title:
        const AppName(fontSize: 20, title: 'Record ', span: 'Sugar Level'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  child: AverageContainer(
                      title: "Average Glucose",
                      values: "6.0mg/dl",
                      avgImg: StringData.dbavg),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: AverageContainer(
                      title: "Last Glucose",
                      values: "10.1mg/dl",
                      avgImg: StringData.dbavg),
                ),
              ],
            ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
            Text("My Trends",
                style: headingStyle.copyWith(fontSize: 18)),
          ),
          const SizedBox(height: 10),
          _displayDiabetesTable()
        ],
      ),
    );
  }

_displayDiabetesTable() {
  return Expanded(
    child: Obx(() {
      return
        diabetesController.diabList.isEmpty ?
            const Center(child: Text("No Data "),)
            :
        ListView.builder(
          itemCount: diabetesController.diabList.length,
            itemBuilder: ((_,index){
              Diabetes diab = diabetesController.diabList[index];
              log.d(diab.toJson());
                 return Container(
                   margin: const EdgeInsets.only(bottom: 10,top:5,left: 10,right: 10),
                   width: 200,
                   height: 100,
                   color: Colors.green,
                 );
          }
        ));
      //   DataTable(
      //   columns: getColumns(diabetesColumnList),
      //   rows: getRows(diabetesController.diabList),
      //   horizontalMargin: 1,
      //   columnSpacing: 25,
      // );
    }),
  );
}
// List<DataColumn> getColumns(List<String> columns) => diabetesColumnList
//     .map((String colname) => DataColumn(
//             label: Text(
//           colname,
//           style: titleStyle,
//         )))
//     .toList();
// List<DataRow> getRows(List<Diabetes> diab) => diab.map((Diabetes data) {
//       final rowCell = [
//         data.testDate,
//         data.testTime,
//         data.testType,
//         data.testValue
//       ];
//       return DataRow(cells: getCells(rowCell));
//     }).toList();
// List<DataCell> getCells(List<dynamic> cells) =>
//     cells.map((celldata) => DataCell(Text(celldata))).toList();



}
