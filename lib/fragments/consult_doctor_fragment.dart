import 'package:flutter/cupertino.dart';
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
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(CupertinoIcons.bell))
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  child: Column(
                    children: [
                      Text("Welcome, Sophi"),
                      Text("Tallk to Doctor"),
                    ],
                  ),
                ),
              )),
        ),
        body: Center(child: Text("Consult Doctor Section")));
  }
}
