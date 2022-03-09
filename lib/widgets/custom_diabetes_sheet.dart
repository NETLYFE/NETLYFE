import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/list_objects.dart';
import 'package:netlyfe/widgets/form_field_container.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomDiabetesSheetWidget extends StatefulWidget {
  const CustomDiabetesSheetWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDiabetesSheetWidget> createState() =>
      _CustomDiabetesSheetWidgetState();
}

class _CustomDiabetesSheetWidgetState extends State<CustomDiabetesSheetWidget> {
  String selValue = 'RBS';

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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Text("ADD SUGAR READING",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            const SizedBox(height: 20),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 10),
              const Text("Choose Test Type"),
              const SizedBox(height: 8),
              FormFieldContainer(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                    isExpanded: true,
                    hint: const Text("Select...."),
                    underline: const SizedBox(),
                    value: selValue,
                    items: dropdownItems,
                    onChanged: (String? newVal) {
                      setState(() {
                        selValue = newVal!;
                      });
                    }),
              )),
              const Text(r"Glucose Value (mg/dl)"),
              const SizedBox(height: 8),
              FormFieldContainer(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter value here",
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
                      "SAVE",
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
          ],
        ));
  }
}
