import 'package:flutter/material.dart';
import 'package:retrieval_practice/screens/home_screen.dart';
import 'themes/my_themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Retrieval Practice',
        theme: appTheme,
        home: HomeScreen(),
      );
  }
}
