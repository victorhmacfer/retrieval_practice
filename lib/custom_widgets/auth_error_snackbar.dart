import 'package:flutter/material.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

SnackBar authErrorSnackBar(String text) => SnackBar(
      duration: Duration(seconds: 3),
      content: Text(
        text,
        style: snackBarTextStyle.copyWith(color: appWhite),
      ),
      backgroundColor: Colors.red[400],
);
