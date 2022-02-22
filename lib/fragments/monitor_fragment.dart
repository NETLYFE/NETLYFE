import 'package:flutter/material.dart';

class MonitorFragment extends StatefulWidget {
  const MonitorFragment({Key? key}) : super(key: key);

  @override
  _MonitorFragmentState createState() => _MonitorFragmentState();
}

class _MonitorFragmentState extends State<MonitorFragment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("Monitor Section"))
    );
  }
}
