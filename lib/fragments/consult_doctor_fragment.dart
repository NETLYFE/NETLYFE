import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';

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
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                actions: [
                  IconButton(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.bell))
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text("Welcome, Sophia!",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: StringData.smallTextColor,
                                fontSize: 15)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Talk to a Doctor",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 17))
                      ],
                    ),
                  ),
                ))),
        body: Center(child: Text("Consult Doctor Section")));
  }
}
