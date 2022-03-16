import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/services/net_theme.dart';

class UploadPresContainer extends StatelessWidget {
  const UploadPresContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? StringData.cont3Color
              : StringData.uploadPresColor,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_upward_outlined,
                  size: 40,
                  color: Colors.black87,
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Upload prescription",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.black87,
                    wordSpacing: 2.0),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "We'll do the rest",
                style: TextStyle(fontSize: 15, color: Colors.black87),
              )
            ],
          ),
          // Image(image: AssetImage("assets/pa.jpg"))
          Image.asset("assets/edit.png", width: 50, height: 50)
        ],
      ),
    );
  }
}
