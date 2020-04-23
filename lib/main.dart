import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrieval_practice/blocs/auth_bloc.dart';
import 'package:retrieval_practice/screens/get_started_screen.dart';
import 'package:retrieval_practice/screens/alt_get_started_screen.dart';
import 'package:retrieval_practice/screens/home_screen.dart';
import 'package:retrieval_practice/screens/login_screen.dart';
import 'package:retrieval_practice/screens/signup_screen.dart';
import 'styles/my_styles.dart';
import 'blocs/bloc_base.dart';
import 'blocs/main_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MainBloc _mainBloc;
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = MainBloc();
    _mainBloc.init();
    _authBloc = AuthBloc();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Retrieval Practice',
      theme: appTheme,
      // home: BlocProvider<MainBloc>(bloc: _mainBloc, child: HomeScreen()),
      // home: BlocProvider<AuthBloc>(bloc: _authBloc, child: SignUpScreen()),
      // home: GetStartedScreen(),
      home: FirstScreenPicker(_authBloc, _mainBloc),
      debugShowCheckedModeBanner: false,
    );
  }
}


class FirstScreenPicker extends StatelessWidget {

  AuthBloc authBloc;
  MainBloc mainBloc;

  FirstScreenPicker(this.authBloc, this.mainBloc);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: authBloc.isSignedIn(),
      builder: (context, snapshot) {
        if (snapshot.data == false) {
          return GetStartedScreen(authBloc, mainBloc);
        } 
        
        return HomeScreen(authBloc, mainBloc);
      }
    );
  }
}

