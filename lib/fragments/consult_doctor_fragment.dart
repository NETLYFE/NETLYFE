import 'package:flutter/material.dart';
class ConsultDoctorFragment extends StatefulWidget {

  const ConsultDoctorFragment({Key? key}) : super(key: key);
  @override
  _ConsultDoctorFragmentState createState() => _ConsultDoctorFragmentState();
 }

class _ConsultDoctorFragmentState extends State<ConsultDoctorFragment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("Consult Doctor Section"))
    );
  }
}
