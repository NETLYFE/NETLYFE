import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlyfe/services/net_theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keytype;
  final Widget? widget;
  const CustomFormField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.keytype,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 10),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                        keyboardType: keytype,
                        readOnly: widget == null ? false : true,
                        autofocus: false,
                        cursorColor: Get.isDarkMode
                            ? Colors.grey[1000]
                            : Colors.grey[700],
                        controller: controller,
                        style: subtitleStyle,
                        decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: subtitleStyle,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: context.theme.backgroundColor,
                                  width: 0)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: context.theme.backgroundColor,
                                  width: 0)),
                        ))),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
