import 'package:flutter/material.dart';
import 'package:netlyfe/services/net_theme.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const CustomButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: appColor),
        child: Center(
            child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
