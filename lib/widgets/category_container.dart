import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final Color catColor;
  final String catImg;
  final String catTitle;
  const CategoryContainer({Key? key,
    required this.catColor,
    required this.catImg,
    required this.catTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: catColor,
            ),
            child: Center(
              child: Image.asset(catImg,width: 20,height: 20,),
            ),
          ),
         const SizedBox(
            height: 8,
          ),
          Text(
              catTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12,

            ),
          )
        ],
      ),
    );
  }
}
