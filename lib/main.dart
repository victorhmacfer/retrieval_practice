import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrieval_practice/blocs/auth_bloc.dart';
import 'package:retrieval_practice/screens/get_started_screen.dart';
import 'package:retrieval_practice/screens/alt_get_started_screen.dart';
import 'package:retrieval_practice/screens/home_screen.dart';
import 'package:retrieval_practice/screens/login_screen.dart';
import 'package:retrieval_practice/screens/settings_screen.dart';
import 'package:retrieval_practice/screens/signup_screen.dart';
import 'styles/my_styles.dart';
import 'blocs/bloc_base.dart';
import 'blocs/main_bloc.dart';


void main() {
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


class FirstScreenPicker extends StatelessWidget {

  MainBloc mainBloc;

  FirstScreenPicker(this.mainBloc);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: mainBloc.isSignedIn(),
      builder: (context, snapshot) {
        if (snapshot.data == false) {
          return GetStartedScreen(mainBloc);
        } 
        
        return HomeScreen(mainBloc);
      }
    );
  }
}

