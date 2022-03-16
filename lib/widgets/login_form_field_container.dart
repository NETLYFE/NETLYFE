import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/services/net_theme.dart';

class LoginFormField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const LoginFormField({Key? key,  required this.hint, this.controller, this.widget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                widget == null
                    ? Container()
                    : Container(
                  child: widget,
                ),
                Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
