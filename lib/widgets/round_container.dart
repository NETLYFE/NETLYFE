import 'package:flutter/material.dart';
class RoundContainer extends StatelessWidget {
  const RoundContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.cyan,
      ),
    );
  }
}
