import 'dart:ffi';

class Diabetes {
  int? id;
  String? testType;
  String? testValue;
  String? testTime;
  int? color;
  String? testDate;

  Diabetes(
      {this.id,
      this.testType,
      this.testValue,
      this.color,
      this.testTime,
      this.testDate});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['testType'] = testType;
    data['testValue'] = testValue;
    data['color'] = color;
    data['testTime'] = testTime;
    data['testDate'] = testDate;

    return data;
  }

  Diabetes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    testType = json['testType'];
    testValue = json['testValue'];
    testTime = json['testTime'];
    testDate = json['testDate'];
    color = json['color'];
  }
}
