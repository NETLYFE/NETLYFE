import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:netlyfe/services/net_theme.dart';

class DrugCategory extends StatefulWidget {
  String category ='';
   DrugCategory({Key? key, required this.category}) : super(key: key);
  @override
  State<DrugCategory> createState() => _DrugCategoryState();
}

class _DrugCategoryState extends State<DrugCategory> {
  @override
  Widget build(BuildContext context) {
    String cat = widget.category;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        iconTheme: const IconThemeData(color:Colors.black54),
        title: Text(cat,style: titleStyle.copyWith(fontSize: 18)),
        centerTitle: true,
        elevation: 0,
        actions: [IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.shopping_cart))],
      ),
      body: Container(),
    );
  }
}
