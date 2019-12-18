import 'package:flutter/material.dart';

const appBlack = Color.fromRGBO(17, 17, 17, 1);
const appWhite = Color.fromRGBO(245, 245, 245, 1);
// const appLightGrey = Color.fromRGBO(158, 158, 158, 1);
const appLightGrey = Color.fromRGBO(171, 171, 171, 1);

const appGrey = Color.fromRGBO(72, 72, 72, 1);
const appPillButtonGrey = Color.fromRGBO(50, 50, 52, 1);
const appDarkGrey = Color.fromRGBO(44, 44, 44, 1);
const appHintTextGrey = Color.fromRGBO(110, 110, 110, 1);
const appDueQuestionDarkRed = Color.fromRGBO(83, 41, 42, 1);
const appDueQuestionLightRed = Color.fromRGBO(251, 139, 128, 1);
const appBlue = Color.fromRGBO(144, 202, 249, 1);
const appFabBlue = Color.fromRGBO(130, 177, 255, 1);

const formFieldGrey = Color(0xFFE9E9E9);

const deckTitleTextStyle =
    TextStyle(fontSize: 20, color: appWhite, fontWeight: FontWeight.w500);

const deckSubtitleTextStyle = TextStyle(
  fontSize: 11,
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
  accentColor: appBlue,
  textSelectionHandleColor: appBlue,

  //TODO: make this button bigger
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: appBlack,
    backgroundColor: appFabBlue,
  ),
);
