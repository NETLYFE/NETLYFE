import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/Utils/list_objects.dart';
import 'package:netlyfe/controllers/dose_controller.dart';
import 'package:netlyfe/models/doserem_model.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/widgets/custom_button.dart';
import 'package:netlyfe/widgets/custom_form_field.dart';

class AddDosePage extends StatefulWidget {
  const AddDosePage({Key? key}) : super(key: key);

  @override
  State<AddDosePage> createState() => _AddDosePageState();
}

class _AddDosePageState extends State<AddDosePage> {
  final DoseController doseController = Get.put(DoseController());
  final nameCtr = TextEditingController();
  final noteCtr = TextEditingController();
  final numofDoseCtr = TextEditingController();
  final timesDailyCtr = TextEditingController();
  var log = Logger();
  String seldoseProgram = "before-meal";
  String selRepeat = "Daily";
  int selColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _customAppBar(),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        children: [
          Text(
            "Add New Dose",
            style: headingStyle,
          ),
          const SizedBox(height: 5),
          CustomFormField(
            title: "Name",
            hint: "Enter name of medicine",
            controller: nameCtr,
          ),
          const SizedBox(height: 5),
          CustomFormField(
            title: "Note",
            hint: "Enter your note",
            controller: noteCtr,
          ),
          const SizedBox(height: 5),
          Row(children: [
            Expanded(
              child: CustomFormField(
                title: "Number of Dose",
                hint: "e.g 2",
                controller: numofDoseCtr,
                keytype: TextInputType.number,
              ),
            ),
            const SizedBox(width: 5),
            Container(
                margin: const EdgeInsets.only(top: 25),
                alignment: Alignment.center,
                child: Text("X", style: headingStyle.copyWith(fontSize: 20))),
            const SizedBox(width: 5),
            Expanded(
                child: CustomFormField(
              title: "Times Daily",
              hint: "e.g 3",
              controller: timesDailyCtr,
              keytype: TextInputType.number,
            ))
          ]),
          const SizedBox(height: 5),
          CustomFormField(
            title: "Program",
            hint: seldoseProgram,
            widget: DropdownButton(
                icon: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey),
                ),
                elevation: 5,
                iconSize: 24,
                underline: Container(height: 0),
                style: subtitleStyle,
                items: doseProgramList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  );
                }).toList(),
                onChanged: (String? newval) {
                  setState(() {
                    seldoseProgram = newval!;
                  });
                }),
          ),
          const SizedBox(width: 5),
          CustomFormField(
              title: "Repeat",
              hint: selRepeat,
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
                    doseRepeatList.map<DropdownMenuItem<String>>((String val) {
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
                    selRepeat = newVal!;
                  });
                },
              )),
          const SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _circleColorPicker(),
            CustomButton(
              label: "Send",
              onTap: () {
                validaetFormField();
              },
            ),
          ])
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

  _circleColorPicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color", style: titleStyle),
        const SizedBox(height: 5),
        Wrap(
            children: List<Widget>.generate(3, (index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  selColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? bluishClr
                        : index == 1
                            ? pinkishClr
                            : yellowishClr,
                    child: selColor == index
                        ? const Icon(Icons.done, color: Colors.white, size: 14)
                        : Container()),
              ));
        }))
      ],
    );
  }

  void validaetFormField() {
    if (nameCtr.text.isNotEmpty &&
        noteCtr.text.isNotEmpty &&
        numofDoseCtr.text.isNotEmpty &&
        timesDailyCtr.text.isNotEmpty) {
      addDoseToDb();
      Get.back(result: true);
    } else {
      Get.snackbar("Required", "All Fields are required",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
          colorText: Get.isDarkMode ? Colors.black : pinkishClr,
          icon: const Icon(
            Icons.warning_amber_outlined,
            color: Colors.amber,
          ));
    }
  }

  void addDoseToDb() async {
    int valueId = await doseController.addDose(
        dose: DoseReminder(
            name: nameCtr.text,
            notes: noteCtr.text,
            numofDose: int.parse(numofDoseCtr.text),
            timesDaily: int.parse(timesDailyCtr.text),
            program: seldoseProgram,
            repeat: selRepeat,
            color: selColor));
    log.d(valueId);
  }
}
