import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/controllers/dose_controller.dart';
import 'package:netlyfe/models/doserem_model.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/views/add_dose.dart';
import 'package:netlyfe/widgets/moni_tile.dart';

class MedicineReminder extends StatefulWidget {
  const MedicineReminder({Key? key}) : super(key: key);

  @override
  State<MedicineReminder> createState() => _MedicineReminderState();
}

class _MedicineReminderState extends State<MedicineReminder> {
  DateTime selectedDate = DateTime.now();
  final doseController = Get.put(DoseController());
  var log = Logger();

  @override
  void initState() {
    super.initState();
    doseController.getAllDose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      floatingActionButton: _customeFloatingButton(),
      body: Column(
        children: [_addDatePicker(), showAllDoses()],
      ),
    );
  }

  customAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          )),
      automaticallyImplyLeading: false,
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
      title: const AppName(fontSize: 20, title: 'Medicine ', span: 'Reminder'),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell,
                color: Get.isDarkMode ? Colors.white : darkHeaderClr))
      ],
    );
  }

  Widget _customeFloatingButton() {
    return FloatingActionButton.extended(
      onPressed: () async {
        await Get.to(() => const AddDosePage());
        doseController.getAllDose();
      },
      label: const Text("ADD"),
      icon: const Icon(Icons.add),
      backgroundColor: appColor,
    );
  }

  Widget _addDatePicker() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: DatePicker(DateTime.now(),
          height: 80,
          width: 50,
          initialSelectedDate: DateTime.now(),
          selectionColor: appColor,
          dateTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey)),
          dayTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey)),
          monthTextStyle: GoogleFonts.lato(
              textStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey)), onDateChange: (date) {
        selectedDate = date;
      }),
    );
  }

  showAllDoses() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: doseController.doseList.length,
            itemBuilder: ((_, index) {
              log.d(doseController.doseList.length);
              DoseReminder dorem = doseController.doseList[index];
              log.d(dorem.toJson());
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 100,
                width: 300,
                color: Colors.green,
              );
            }));
      }),
    );
  }

  // Widget _addDossageBar() {
  //   return Container(
  //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //       Text(
  //         "Today",
  //         style: headingStyle,
  //       ),
  //       Text(
  //         DateFormat.yMMMMd().format(DateTime.now()),
  //         style: subHeadingStyle,
  //       ),
  //     ]),
  //   );
  // }

}
