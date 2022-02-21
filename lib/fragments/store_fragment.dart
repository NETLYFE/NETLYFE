import 'package:flutter/material.dart';

class StoreFragment extends StatefulWidget {
  const StoreFragment({Key? key}) : super(key: key);
  @override
  _StoreFragmentState createState() => _StoreFragmentState();
 }

class _StoreFragmentState extends State<StoreFragment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("Store Section"))
    );
  }
}
