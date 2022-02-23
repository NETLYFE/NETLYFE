import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/widgets/monitor_container.dart';

class MonitorFragment extends StatefulWidget {
  const MonitorFragment({Key? key}) : super(key: key);

  @override
  _MonitorFragmentState createState() => _MonitorFragmentState();
}

class _MonitorFragmentState extends State<MonitorFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          automaticallyImplyLeading: false,
          title: const AppName(fontSize: 20, title: 'Net', span: 'Monitor'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(left: 15,top: 10,right: 15),
          children: const [
             MonitorContainer(
              monitorName: StringData.bpmonitor,
              desc: StringData.bpmonitordesc,
              imageSrc: StringData.bpmoniimg,
            )
          ],
        )
    );
  }
}
