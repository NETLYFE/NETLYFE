import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/Utils/list_objects.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/widgets/average_container.dart';
import 'package:netlyfe/widgets/custom_bp_datatable.dart';
import 'package:netlyfe/widgets/custom_floating_action_btn.dart';
import 'package:netlyfe/widgets/custom_bp_sheet.dart';
import 'package:netlyfe/widgets/stages_container.dart';

class BPMonitorView extends StatelessWidget {
  const BPMonitorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        title: const AppName(
            fontSize: 20, title: 'Record ', span: 'Blood Pressure'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AverageContainer(
                  title: "My Average BP",
                  values: "139/80",
                  avgImg: StringData.bpavg,
                ),
                AverageContainer(
                  title: "My Last BP",
                  values: "155/95",
                  avgImg: StringData.bpavg,
                ),
              ]
            ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(bpstageList.length, (index) {
                  return StagesContainer(
                      stgName: bpstageList[index].stageName,
                      stgColor: bpstageList[index].stageColor);
                })),
          ),
          const SizedBox(height: 25),
          const Text("My Trends",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black87)),
          const SizedBox(height: 10),
          const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: CustomBPDataTable(),
          )
        ],
      ),
      floatingActionButton: const CustomFloatingButton(
        bottomsheetWidget: CustomBPSheetWidget(),
      ),
    );
  }
}
