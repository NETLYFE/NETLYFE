import 'package:get/get.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:netlyfe/widgets/search_box.dart';
import 'package:flutter/material.dart';

class CustomContainer1 extends StatelessWidget {
  const CustomContainer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? darkHeaderClr : Colors.grey[300],
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text:
                    TextSpan(text: 'Hey, ', style: titleStyle, children: const [
              TextSpan(
                  text: 'Sophia',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: yellowishClr))
            ])),
            const SizedBox(
              height: 5,
            ),
            Text(StringData.welcomeText, style: descriptionStyle),
            const SizedBox(
              height: 8,
            ),
            const SearchBox()
          ],
        ),
      ),
    );
  }
}
