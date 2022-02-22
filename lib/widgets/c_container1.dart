
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';
import 'package:netlyfe/widgets/search_box.dart';

class CustomContainer1 extends StatelessWidget {
  const CustomContainer1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15,top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text: TextSpan(
              text: 'Hey, ',
              style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Theme.of(context).colorScheme.primary),
              children: [
                TextSpan(
                  text: 'Sophia',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.tertiary)
                )
              ]
            )),
            const SizedBox(height: 5,),
            Text(
               StringData.welcomeText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w400
              ),
            ),
            const SearchBox()
          ],
        ),
      ),
    );
  }
}
