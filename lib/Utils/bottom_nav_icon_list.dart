import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<IconData> navIconList = [
  Icons.medical_services_outlined,
  Icons.graphic_eq_outlined,
  Icons.article_outlined,
  Icons.account_circle_outlined,
];

final List<String> categoryList = [
  "All",
  "Pneumonia",
  "Diabetes",
  "Blood Pressure",
  "Malaria"
];

class Doctors {
  final String name;
  final String role;
  final String reviews;
  final double ratings;

  Doctors(this.name, this.role, this.reviews, this.ratings);
}

final List<Doctors> docList = [
  Doctors("Anna Baker", "Diabetic Surgeon", "19", 3.5),
  Doctors("Micheal Oteng", "Malaria Specialist", "10", 2.5),
  Doctors("Yaw Opoku Ware", "Blood Pressure", "34", 2.0),
];
