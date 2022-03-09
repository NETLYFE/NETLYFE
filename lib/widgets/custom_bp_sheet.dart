import 'package:flutter/material.dart';
import 'package:netlyfe/widgets/form_field_container.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomBPSheetWidget extends StatelessWidget {
  const CustomBPSheetWidget({
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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            Text("ADD B.P READING",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            const SizedBox(height: 20),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 10),
              const Text("Systolic BP"),
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
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
