import 'package:flutter/material.dart';

class AppColors {
  static AppColors? _current;
  static AppColors get current => _current ?? _defaultLightColors;
  static set current(value) => _current = value;

  AppColors({
    required this.primary,
    required this.blueButtons,
    required this.lightGreenText,
    required this.text,
    required this.blueText,
    required this.orangeText,
    required this.greenButtons,
    required this.lightBlueText,
    required this.swatch,
    required this.purpleButtons,
    required this.purpleText,
    required this.white,
    required this.orangeButtons,
    required this.darkGreen,
    required this.darkOrange,
    required this.darkGreenButton,
    required this.darkBlue,
    required this.darkPurple,
    required this.bottomBar,
    required this.greenBackground,
    required this.orangeBackground,
    required this.darkGreenBackground,
    required this.lightPurpleBackground,
    required this.blueBackground,
    required this.purpleBackground,
    required this.veryDarkPurple,
    required this.darkRed,
    required this.red,



  });
  Color primary;
  Color blueButtons;
  Color lightGreenText;
  Color blueText;
  Color text;
  Color orangeButtons;
  Color orangeText;
  Color greenButtons;
  MaterialColor swatch;
  Color lightBlueText;
  Color purpleButtons;
  Color purpleText;
  Color white;
  Color darkGreen;
  Color darkOrange;
  Color darkGreenButton;
  Color darkBlue;
  Color darkPurple;
  Color bottomBar;
  Color greenBackground;
  Color orangeBackground;
  Color darkGreenBackground;
  Color red;
  Color veryDarkPurple;
  Color darkRed;
  Color purpleBackground;
  Color blueBackground;
  Color lightPurpleBackground;
}

var _defaultLightColors = AppColors(
  swatch: const MaterialColor(
    0xff1A998E,
    <int, Color>{
      50: Color(0xff1A998E),
      100: Color(0xff1A998E),
      200: Color(0xff1A998E),
      300: Color(0xff1A998E),
      400: Color(0xff1A998E),
      500: Color(0xff1A998E),
      600: Color(0xff1A998E),
      700: Color(0xff1A998E),
      800: Color(0xff1A998E),
      900: Color(0xff1A998E),
    },
  ),
  primary: const Color(0xFFB7D4FA),
  blueButtons: const Color(0xFF78B1FE),
  blueText: const Color(0xFF1578EC),
  white: const Color(0xFFFFFFFF),
  text: const Color(0xff000000),
  lightBlueText: const Color(0xFF86B6F6),
  lightGreenText: const Color(0xFF55D19A),
  greenButtons: const Color(0xff5AE4A7),
  orangeText:const Color(0xffFF735C),
  orangeButtons:const Color(0xFFFF735C),
  purpleButtons: const Color(0xffD268CC),
  purpleText: const Color(0xffD572CF),
  darkGreen : const Color(0xff234946),
  darkOrange : const Color(0xffCE5F4D),
  darkGreenButton : const Color(0xff3FA075),
  darkBlue: const Color(0xff558BD1),
  darkPurple: const Color(0xff994C95),
  bottomBar: const Color(0xffBB90D8),
  greenBackground: const Color(0xffD5F8E4),
  orangeBackground : const Color(0xffFF948F),
  darkGreenBackground: const Color(0xff385A64),
  lightPurpleBackground: const Color(0xffEEC4EA),
  blueBackground: const Color(0xff86B6F6),
  purpleBackground: const Color(0xff385A64),
  veryDarkPurple: const Color(0xff331338),
  darkRed:const Color(0xffA01B1B),
  red: const Color(0xffDA1313)
);
