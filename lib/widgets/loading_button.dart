import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:netlyfe/services/net_theme.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoadingButton extends StatelessWidget {
  final RoundedLoadingButtonController controller;
  final Function()? onTap;
  final String label;
  const LoadingButton(
      {Key? key,
      required this.controller,
      required this.onTap,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
        controller: controller,
        width: MediaQuery.of(context).size.width * 1.0,
        color: appColor,
        child: Wrap(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
        onPressed: onTap);
  }
}
