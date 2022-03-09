import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';

class AverageContainer extends StatelessWidget {
  final String title;
  final String values;
  final String avgImg;

  const AverageContainer(
      {Key? key,
      required this.title,
      required this.values,
      required this.avgImg})
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
                avgImg,
                width: 30,
              ),
              Text(values,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: StringData.bpreadingtext)),
            ]),
      ),
    );
  }
}
