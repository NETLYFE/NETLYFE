import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/app_name.dart';
import 'package:netlyfe/Utils/list_objects.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/widgets/custom_datatable.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AverageBPContainer(title: "My Average BP", values: "139/80"),
                AverageBPContainer(title: "My Last BP", values: "155/95"),
              ]),
          const SizedBox(height: 16),
          SingleChildScrollView(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(bpstageList.length, (index) {
                  return BPStages(
                      stgName: bpstageList[index].stageName,
                      stgColor: bpstageList[index].stageColor);
                })),
          ),
          const SizedBox(height: 25),
          const Text("My Trends",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black87)),
          const SizedBox(height: 10),
          const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: CustomDataTable(),
          )
        ],
      ),
      floatingActionButton: const CustomFloatingButton(),
    );
  }
}

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  bool showfab = true;
  void showFabButton(bool val) {
    setState(() {
      showfab = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showfab
        ? FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Image.asset(StringData.addbpimg, width: 24, height: 24),
            onPressed: () {
              showFabButton(false);
              var showBottomSheetController = showBottomSheet(
                  context: context,
                  builder: (context) => const CustomSheetWidget());
              showBottomSheetController.closed.then((value) {
                showFabButton(true);
              });
            },
          )
        : Container();
  }
}

class CustomSheetWidget extends StatelessWidget {
  const CustomSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btnController = RoundedLoadingButtonController();

    return Container(
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                blurRadius: 10, color: Colors.grey.shade200, spreadRadius: 5)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),
            const Text("Systolic BP"),
            FormFieldContainer(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Top number",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Text("Diastolic BP"),
            FormFieldContainer(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Bottom number",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Text("Pulse BP"),
            FormFieldContainer(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Pulse number",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            RoundedLoadingButton(
              controller: btnController,
              width: MediaQuery.of(context).size.width * 1.0,
              color: Theme.of(context).primaryColor,
              child: Wrap(
                children: const [
                  Text(
                    "NEXT",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                // nextScreen(context, const OTPView());
                btnController.reset();
              },
            ),
          ]),
        ));
  }
}

class FormFieldContainer extends StatelessWidget {
  final Widget child;
  const FormFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(top: 10, bottom: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(3),
        ),
        child: child);
  }
}

class BPStages extends StatelessWidget {
  final String stgName;
  final Color stgColor;
  const BPStages({
    Key? key,
    required this.stgName,
    required this.stgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(shape: BoxShape.circle, color: stgColor),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          stgName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 14),
        )
      ],
    );
  }
}

class AverageBPContainer extends StatelessWidget {
  final String title;
  final String values;

  const AverageBPContainer(
      {Key? key, required this.title, required this.values})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
          color: StringData.boxColor, borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: StringData.avgtext,
                    fontSize: 16),
              ),
              Image.asset(
                StringData.bpavg,
                width: 30,
              ),
              Text(values,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: StringData.bpreadingtext)),
            ]),
      ),
    );
  }
}
