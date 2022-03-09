import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/Utils/screen_intents.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/views/bp_monitor_view.dart';
import 'package:netlyfe/views/consult_doctor_view.dart';
import 'package:netlyfe/views/medicine_reminder.dart';
import 'package:netlyfe/views/sugar_level_view.dart';

class MonitorFragment extends StatefulWidget {
  const MonitorFragment({Key? key}) : super(key: key);

  @override
  _MonitorFragmentState createState() => _MonitorFragmentState();
}

class _MonitorFragmentState extends State<MonitorFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const AppName(fontSize: 20, title: 'Net', span: 'Monitor'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
          children: [
            const SizedBox(height: 16),
            MonitorContainer(
              btnColor: StringData.cont1Color,
              btnTitle: StringData.bpmonitor,
              btnDescription: StringData.bpmonitordesc,
              imgSrc: StringData.bpmoniimg,
              onBtnTap: () {
                Get.to(() => const BPMonitorView());
              },
            ),
            const SizedBox(height: 16),
            MonitorContainer(
              btnColor: StringData.cont2Color,
              btnTitle: StringData.diabetesmonitor,
              btnDescription: StringData.diabetesmonitordesc,
              imgSrc: StringData.diabimg,
              onBtnTap: () {
                Get.to(() => const RecordSugarLevel());
              },
            ),
            const SizedBox(height: 16),
            MonitorContainer(
              btnColor: StringData.cont3Color,
              btnTitle: StringData.dossagereminder,
              btnDescription: StringData.dossagereminddesc,
              imgSrc: StringData.dreminder,
              onBtnTap: () {
                Get.to(() => const MedicineReminder());
              },
            ),
            const SizedBox(height: 16),
            MonitorContainer(
              btnColor: StringData.cont4Color,
              btnTitle: StringData.consultdoctor,
              btnDescription: StringData.consultdocdesc,
              imgSrc: StringData.cdoc,
              onBtnTap: () {
                Get.to(() => const ConsultDoctor());
              },
            ),
          ],
        ));
  }
}

class MonitorContainer extends StatelessWidget {
  final Color btnColor;
  final String btnTitle;
  final String btnDescription;

  final String imgSrc;
  final Function onBtnTap;
  const MonitorContainer(
      {Key? key,
      required this.btnColor,
      required this.btnTitle,
      required this.btnDescription,
      required this.imgSrc,
      required this.onBtnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onBtnTap();
      },
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      btnTitle,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      btnDescription,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: StringData.textcolor1),
                    )
                  ],
                ),
              ),
              Image.asset(imgSrc, width: 80)
            ],
          ),
        ),
      ),
    );
  }
}
