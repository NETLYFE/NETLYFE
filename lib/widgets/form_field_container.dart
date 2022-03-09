import 'package:flutter/material.dart';

class FormFieldContainer extends StatelessWidget {
  final Widget child;
  const FormFieldContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(3),
        ),
        child: child);
  }
}
