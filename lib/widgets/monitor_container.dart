import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';

class MonitorContainer extends StatelessWidget {
  final String monitorName;
  final String desc;
  final String imageSrc;
  final Color btnColor;
  final Function onClick;
  const MonitorContainer(
      {Key? key,
      required this.monitorName,
      required this.desc,
      required this.imageSrc,
      required this.btnColor,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick(),
      splashColor: StringData.appThemeColor1,
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      monitorName,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      desc,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: StringData.textcolor1),
                    )
                  ],
                ),
              ),
              Image.asset(imageSrc, width: 80)
            ],
          ),
        ),
      ),
    );
  }
}
