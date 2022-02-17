import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void nextScreen(context,intent){
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => intent));
}

void nextScreenIos(context,intent){
  Navigator.push(context, CupertinoPageRoute(
    builder: (context) => intent));
}

void nextScreenCloseOthers (context, page){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
    builder: (context) => page), (route) => false);
}

void nextScreenReplace (context, page){
  Navigator.pushReplacement(context, MaterialPageRoute(
    builder: (context) => page));
}



