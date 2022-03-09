import 'package:flutter/material.dart';
import 'package:netlyfe/services/net_theme.dart';

class CategoryContainer extends StatelessWidget {
  final Color catColor;
  final String catImg;
  final String catTitle;
  final Function()? onTap;
  const CategoryContainer(
      {Key? key,
      required this.catColor,
      required this.catImg,
      required this.catTitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: catColor,
            child: Center(
                child: Image.asset(
              catImg,
              width: 18,
              height: 20,
            )),
          ),
          const SizedBox(height: 8),
          Text(catTitle,
              textAlign: TextAlign.center,
              style: titleStyle.copyWith(fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
