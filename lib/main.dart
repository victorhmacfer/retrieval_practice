import 'package:flutter/material.dart';
import 'package:retrieval_practice/screens/home_screen.dart';
import 'styles/my_styles.dart';
import 'blocs/bloc_base.dart';
import 'blocs/main_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = MainBloc();
    _mainBloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieval Practice',
      theme: appTheme,
      home: BlocProvider<MainBloc>(bloc: _mainBloc, child: HomeScreen()),
    );
  }
}
