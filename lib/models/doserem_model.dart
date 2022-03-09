class DoseReminder {
  int? id;
  String? name;
  String? notes;
  String? startTime;
  int? color;
  int? numofDose;
  int? timesDaily;
  String? program;
  String? repeat;

  DoseReminder(
      {this.id,
      this.name,
      this.notes,
      this.startTime,
      this.color,
      this.numofDose,
      this.timesDaily,
      this.program,
      this.repeat});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['notes'] = notes;
    data['startTime'] = startTime;
    data['color'] = color;
    data['numofDose'] = numofDose;
    data['timesDaily'] = timesDaily;
    data['program'] = program;
    data['repeat'] = repeat;

    return data;
  }

  DoseReminder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    notes = json['notes'];
    startTime = json['startTime'];
    color = json['color'];
    numofDose = json['numofDose'];
    timesDaily = json['timesDaily'];
    program = json['program'];
    repeat = json['repeat'];
  }
}
