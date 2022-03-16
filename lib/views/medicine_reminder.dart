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
      label: const Text(
        "ADD",
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.add, color: Colors.white),
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
              DoseReminder dorem = doseController.doseList[index];
              log.d(dorem.toJson());
              print(dorem.toJson());
              return AnimationConfiguration.staggeredList(
                  position: index,
                  child: SlideAnimation(
                      child: FadeInAnimation(
                          child: GestureDetector(
                              onTap: () {
                                _showBottomSheet(context, dorem);
                              },
                              child: MoniTile(dorem)))));
            }));
      }),
    );
  }
  _showBottomSheet(BuildContext ctx, DoseReminder dose) {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.only(top: 4),
      height: dose.startTime == null
          ? MediaQuery.of(ctx).size.height * 0.32
          : MediaQuery.of(ctx).size.height * 0.25,
      color: Get.isDarkMode ? darkGreyClr : Colors.white,
      child: Column(
        children: [
          Container(
            height: 6,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
          ),
          const Spacer(),
          dose.startTime != null
              ? Container()
              : bottomSheetBody(
                  label: "Set Reminder",
                  onTap: () {
                    Get.back();
                  },
                  clr: appColor,
                  context: ctx),
          const SizedBox(
            height: 10,
          ),
          bottomSheetBody(
              label: "Delete Dose",
              onTap: () {
                doseController.delete(dose);
                Get.back();
              },
              clr: Colors.red[300]!,
              context: ctx),
          const SizedBox(height: 5),
          bottomSheetBody(
              label: "Close",
              onTap: () {
                Get.back();
              },
              clr: Colors.red[300]!,
              context: context,
              isClosed: true),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }

  bottomSheetBody(
      {required String label,
      required Function()? onTap,
      required Color clr,
      bool isClosed = false,
      required BuildContext context}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: isClosed == true ? Colors.transparent : clr,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: 2,
                color: isClosed == true
                    ? Get.isDarkMode
                        ? Colors.grey[600]!
                        : Colors.grey[300]!
                    : clr)),
        child: Center(
            child: Text(label,
                style: isClosed
                    ? titleStyle
                    : titleStyle.copyWith(color: Colors.white))),
      ),
    );
  }
}
