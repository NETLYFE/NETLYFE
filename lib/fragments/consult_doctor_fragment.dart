import 'package:flutter/material.dart';

class ConsultDoctorFragment extends StatefulWidget {
  const ConsultDoctorFragment({Key? key}) : super(key: key);
  @override
  _ConsultDoctorFragmentState createState() => _ConsultDoctorFragmentState();
}

class _ConsultDoctorFragmentState extends State<ConsultDoctorFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            automaticallyImplyLeading: false,
          ),
        ),
        body: Center(child: Text("Consult Doctor Section")));
  }
}
