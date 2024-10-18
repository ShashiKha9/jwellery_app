import 'package:flutter/material.dart';

class AppColors {
  static const fontBlack = Color(0xFF1A1818);
  static const darkBlue = Color(0xFF00356A);
  static const darkOrange = Color(0xFFBD5319);
  static const darkGreen = Color(0xFF5F712D);
  static const darkGrey = Color(0xFF4A4A4A);
  static const lightGrey = Color(0xFF978D85);
  static const lightblue = Color(0xFFCCDCEC);
  static const offWhite = Color.fromARGB(255, 6, 76, 181);
  static const white = Color(0xFFF9F9F9);
  static const greyshade = Color(0xFF6B6B6B);
  static const black = Color(0xFF111111);
  static const appGrey = Color(0xFFADADAD);
  static const red = Color(0xFFEB0000);
  static const red2 = Color(0xFFFF0000);
  static const redAccent = Color(0xFFFFEAEA);
  static const grey = Color(0xFF767676);
  static const darkBrown = Color(0xFF873e23);
  static const brown = Color(0xFF5C4033);
  static const lightGreen = Color(0xFF51de0b);



}

// default padding
const double defaultPadding = 15;
const double defaulthorizontalPaddinglead = 47;
const double defaultverticalPaddinglead = 14;

// default elevation
const double defaultElevation = 8;

// default iconButton splash radius
const double defaultSplashRadius = 20;

// default circularRadius
const double defaultCircularRadius = 15;

// default Radius Card
const double defaultCircularRadiusCard = 10;
const double defaulthorizontal = 19;
const double defaultvertical = 10;
const double defaultmargin = 14;
const double defaulttoppadding = 12;

ThemeData get dateTimePickerTheme => ThemeData(
      textTheme: const TextTheme(
        labelSmall: TextStyle(fontSize: 20),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.lightblue,
        primary: AppColors.darkBrown,
      ),
    );
