import 'package:flutter/material.dart';

class ArticleFragment extends StatefulWidget {
  const ArticleFragment({Key? key}) : super(key: key);

  @override
  _ArticleFragmentState createState() => _ArticleFragmentState();
}

class _ArticleFragmentState extends State<ArticleFragment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Text("Article Section"))
    );
  }
}
