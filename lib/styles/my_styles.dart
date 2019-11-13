import 'package:flutter/material.dart';

const appBlack = Color.fromRGBO(15, 15, 15, 1);
const appWhite = Color.fromRGBO(240, 240, 240, 1);
const appLightGrey = Color.fromRGBO(158, 158, 158, 1);
const appGrey = Color.fromRGBO(72, 72, 72, 1);
const appDarkGrey = Color.fromRGBO(48, 48, 48, 1);
const appHintTextGrey = Color.fromRGBO(110, 110, 110, 1);
const appDueQuestionDarkRed =
    Color.fromARGB(140, 200, 56, 56); // THIS ONE IS ARGB !
const appDueQuestionLightRed = Color.fromRGBO(239, 154, 154, 1);
const appBlue = Color.fromRGBO(144, 202, 249, 1);

const deckTitleTextStyle =
    TextStyle(fontSize: 22, color: appWhite, fontWeight: FontWeight.w500);

const deckSubtitleTextStyle = TextStyle(
  fontSize: 12,
  color: appLightGrey,
);

const noQuestionsYetTextStyle = TextStyle(
    fontSize: 18, height: 1.3, color: appWhite, fontWeight: FontWeight.w600);

const deckTitleTextStyleBigger =
    TextStyle(fontSize: 26, color: appWhite, fontWeight: FontWeight.w600);

const appTitleTextStyle =
    TextStyle(fontSize: 24, color: appWhite, fontWeight: FontWeight.w600);

const pillButtonTextStyle = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w500,
);

const hintTextStyle = TextStyle(color: appHintTextGrey);

var appTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: appBlack,

  //TODO: make this button bigger
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: appBlack,
    backgroundColor: Colors.blue[100],
  ),
);
