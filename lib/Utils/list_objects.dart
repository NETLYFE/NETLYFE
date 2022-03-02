import 'dart:ui';

import 'package:netlyfe/Utils/strings.dart';

class BPStages {
  final String stageName;
  final Color stageColor;

  BPStages(this.stageName, this.stageColor);
}

List<BPStages> bpstageList = [
  BPStages("Low", StringData.lowColor),
  BPStages("Norm", StringData.nomColor),
  BPStages("Prehype", StringData.preHypColor),
  BPStages("Stg 1", StringData.stg1Color),
  BPStages("Stg 2", StringData.stg2Color),
];

final bpColumnList = ['Date', 'Time', 'Syst', 'Dias', 'Pulse'];

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
