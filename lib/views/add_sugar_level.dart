import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/Utils/list_objects.dart';
import 'package:netlyfe/controllers/diabetes_controller.dart';
import 'package:netlyfe/models/diabetes.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/widgets/custom_button.dart';
import 'package:netlyfe/widgets/custom_form_field.dart';

class AddSugarLevelPage extends StatefulWidget {
  const AddSugarLevelPage({Key? key}) : super(key: key);

  @override
  _AddSugarLevelPageState createState() => _AddSugarLevelPageState();
}

class _AddSugarLevelPageState extends State<AddSugarLevelPage> {
  String seltestType = "FBS";
  var log = Logger();
  TextEditingController valuectr = TextEditingController();
  final diabetesController = Get.put(DiabetesController());
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy/MM/dd');
  String testTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _customAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
        children: [
          Text(
            "Add Sugar Reading",
            style: headingStyle,
          ),
          const SizedBox(height: 20),
          CustomFormField(
              title: "Choose Test Type",
              hint: seltestType,
              widget: DropdownButton(
                icon: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey),
                ),
                underline: Container(
                  height: 0,
                ),
                iconSize: 24,
                elevation: 5,
                items:
                sugarTextTypeList.map<DropdownMenuItem<String>>((String val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(
                      val,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                }).toList(),
                onChanged: (String? newVal) {
                  setState(() {
                    seltestType = newVal!;
                  });
                },
              )),
          const SizedBox(height: 16),
          CustomFormField(
              title: "Glucose Value (mg/dl)",
              hint: "Enter value here",
              controller: valuectr
          ),
          const SizedBox(height: 25),
          SizedBox(
            width: 100,
            child: CustomButton(
                label: "SAVE",
                onTap: (){
                  saveDataToDB();
                  Get.back();
                }
            ),
          )

        ],
      ),
    );
  }

  _customAppBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      iconTheme:
      IconThemeData(color: Get.isDarkMode ? Colors.white : Colors.black),
    );
  }

  void saveDataToDB() async{
    final String formattedDate = formatter.format(now);
    if(valuectr.text.isEmpty){
      Get.snackbar("Form Validation", "Sugar level is required");
    }else{
      int valId = await diabetesController.addSugar(
          diab: Diabetes(
              testType: seltestType,
              testValue: valuectr.text,
              testDate: formattedDate,
              testTime: testTime
          )
      );
      log.d(valId);
    }
    }
  }




