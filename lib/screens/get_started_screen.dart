import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrieval_practice/blocs/auth_bloc.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';
import 'package:retrieval_practice/screens/signup_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

import 'login_screen.dart';

//TODO: fix appearance  and use styles
class GetStartedScreen extends StatelessWidget {

  final MainBloc mainBloc;

  GetStartedScreen(this.mainBloc);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    var screenHeight = MediaQuery.of(context).size.height;

    return Material(
      child: Container(
        alignment: Alignment(0, 1.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/space-get-started.jpg'),
                fit: BoxFit.fill)),
        child: Container(
          // color: Colors.green,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'SPACED',
                style: TextStyle(fontSize: 56, letterSpacing: 12),
              ),
              SizedBox(height: screenHeight * 0.25),
              Container(
                // color: Colors.red,
                height: 280,
                padding:
                    const EdgeInsets.symmetric(vertical: 56, horizontal: 44),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AccentPillButton('GET STARTED'),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SignUpScreen(mainBloc),
                              ));
                        },
                        child: HollowPillButton('SIGN UP')),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(mainBloc),
                            ));
                      },
                      child: Text(
                        'Already registered ?',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
