import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

import 'package:retrieval_practice/screens/get_started_screen.dart';
import 'package:retrieval_practice/screens/home_screen.dart';


class FirstScreenPicker extends StatelessWidget {

  final MainBloc mainBloc;

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
