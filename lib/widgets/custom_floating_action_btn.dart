import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/widgets/custom_bp_sheet.dart';

class CustomFloatingButton extends StatefulWidget {
  final Widget bottomsheetWidget;
  const CustomFloatingButton({Key? key, required this.bottomsheetWidget})
      : super(key: key);

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  bool showfab = true;
  void showFabButton(bool val) {
    setState(() {
      showfab = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showfab
        ? FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Image.asset(StringData.addbpimg, width: 24, height: 24),
            onPressed: () {
              showFabButton(false);
              var showBottomSheetController = showBottomSheet(
                  context: context,
                  builder: (context) => widget.bottomsheetWidget);
              showBottomSheetController.closed.then((value) {
                showFabButton(true);
              });
            },
          )
        : Container();
  }
}
