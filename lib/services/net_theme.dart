import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color appColor = Color.fromRGBO(35, 117, 103, 1);
const Color appColor2 = Color.fromRGBO(163, 153, 144, 1);
const Color greenkishClr = Color.fromRGBO(0, 159, 137, 1);
const Color bluishClr = Color(0xFF4e5ae8);
const Color titleColor = Color.fromRGBO(34, 48, 58, 1);
const Color subtitleColor = Color.fromRGBO(120, 136, 152, 1);
const Color yellowishClr = Color(0xFFFFB746);
const Color orangeClr = Color.fromRGBO(250, 151, 84, 1);
const Color pinkishClr = Color(0xFFff4667);
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

//DRUG CATEGORY CART
const Color catboxColor = Color.fromRGBO(243, 243, 243, 1);
const Color cartBtn = Color.fromRGBO(115, 170, 134, 1);

class NetThemes {
  static final lightMode = ThemeData(
      primaryColor: appColor,
      brightness: Brightness.light,
      backgroundColor: Colors.white);

  static final darkMode = ThemeData(
      primaryColor: darkGreyClr,
      backgroundColor: darkGreyClr,
      brightness: Brightness.dark);
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.white : Colors.black));
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.grey[100] : Colors.grey[600]));
}

//A function to return textStyle
TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.grey[400] : Colors.grey));
}

//A function to return textStyle
TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode
              ? const Color.fromARGB(255, 224, 197, 197)
              : Colors.black));
}

TextStyle get descriptionStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.grey[100] : Colors.black));
}

TextStyle get buttonTextStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey[100]));
}

TextStyle get detailstitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Get.isDarkMode ? Colors.white : titleColor));
}

TextStyle get detailsubtitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.grey[100] : subtitleColor));
}

TextStyle get detaildescriptionStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode ? Colors.grey[100] : subtitleColor));
}
