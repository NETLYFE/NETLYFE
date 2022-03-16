import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';

class Stages {
  final String stageName;
  final Color stageColor;

  Stages(this.stageName, this.stageColor);
}

List<Stages> bpstageList = [
  Stages("Low", StringData.lowColor),
  Stages("Norm", StringData.nomColor),
  Stages("Prehype", StringData.preHypColor),
  Stages("Stg 1", StringData.stg1Color),
  Stages("Stg 2", StringData.stg2Color),
];

List<Stages> diabetStageList = [
  Stages("Excellence", StringData.excellentColor),
  Stages("Good", StringData.goodColor),
  Stages("Poor", StringData.poorColor),
];

final bpColumnList = ['Date', 'Time', 'Syst', 'Dias', 'Pulse'];
final diabetesColumnList = ['Date', 'Time', 'Test Type', 'mg/dl'];
class BPData {
  final String date;
  final String time;
  final String systolic;
  final String diastolic;
  final String pulse;
  BPData(this.date, this.time, this.systolic, this.diastolic, this.pulse);
}

List<BPData> bpdataList = [
  BPData("16/08/2019", "10:17", "110", "80", "70"),
  BPData("16/08/2019", "04:16", "110", "80", "45"),
  BPData("16/08/2019", "10:17", "110", "80", "89"),
  BPData("16/08/2019", "10:17", "110", "80", "12"),
  BPData("16/08/2019", "10:17", "110", "80", "12"),
  BPData("16/08/2019", "10:17", "110", "80", "12"),
];

class DiabetesData {
  final String date;
  final String time;
  final String testtype;
  final String value;
  DiabetesData(this.date, this.time, this.testtype, this.value);
}

List<DiabetesData> diabetesdataList = [
  DiabetesData("16/08/2019", "10:17", "FBS", "6.0"),
  DiabetesData("16/08/2019", "04:16", "FBS", "2.5"),
  DiabetesData("16/08/2019", "10:17", "RBS", "3.9"),
  DiabetesData("16/08/2019", "10:17", "RBS", "1.0"),
  DiabetesData("16/08/2019", "10:17", "RBS", "5.5"),
];



class Disease {
  final String name;
  final String slug;
  final String img;
  Disease(this.name, this.slug, this.img);
}

List<Disease> diseaseList = [
  Disease("Blood Pressure", "bp", StringData.bpimg),
  Disease("Pneumonia", "pn", StringData.pneumoimg),
  Disease("Diabetes", "db", StringData.diabetimg),
  Disease("Malaria", "ml", StringData.malaimg),
];

List<String> doseRepeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
List<String> doseProgramList = ["before-meal", "after-meal"];
List<String> sugarTextTypeList = ['FBS','RBS'];

