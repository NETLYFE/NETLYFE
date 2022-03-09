import 'package:flutter/material.dart';

class StagesContainer extends StatelessWidget {
  final String stgName;
  final Color stgColor;
  const StagesContainer({
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
