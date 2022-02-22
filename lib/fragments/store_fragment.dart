import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/widgets/c_container1.dart';

class StoreFragment extends StatefulWidget {
  const StoreFragment({Key? key}) : super(key: key);
  @override
  _StoreFragmentState createState() => _StoreFragmentState();
 }

class _StoreFragmentState extends State<StoreFragment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         backgroundColor: Theme.of(context).backgroundColor,
         automaticallyImplyLeading: false,
         title: const AppName(fontSize: 20, title: 'Net', span: 'Store'),
       ),
        body: ListView(
          padding: const EdgeInsets.only(left: 10,top: 10,right: 10),
          children: const[
            CustomContainer1()
          ],
        )
    );
  }
}
