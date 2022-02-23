import 'package:flutter/material.dart';
import 'package:netlyfe/Utils/strings.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined,size: 18,)),
          const Text(StringData.searchtext,style: TextStyle(fontWeight: FontWeight.w300),)
        ],
      )
    );
  }
}
