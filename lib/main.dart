import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles/my_styles.dart';
import 'blocs/main_bloc.dart';
import 'package:retrieval_practice/screens/first_screen_picker.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final MainBloc _mainBloc = MainBloc();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Spaced',
      theme: appTheme,
      // home: BlocProvider<MainBloc>(bloc: _mainBloc, child: HomeScreen()),
      // home: BlocProvider<AuthBloc>(bloc: _authBloc, child: SignUpScreen()),
      // home: GetStartedScreen(),

      home: FirstScreenPicker(_mainBloc),
      debugShowCheckedModeBanner: false,
    );
  }
}



