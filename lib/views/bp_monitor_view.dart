import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/app_name.dart';

class BPMonitorView extends StatelessWidget {
  const BPMonitorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const AppName(fontSize: 20, title: 'Net', span: 'Monitor'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        children: [],
      ),
    );
  }
}
