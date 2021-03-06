import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/utils/app_i18n.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';
import 'package:retrieval_practice/screens/signup_screen.dart';

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

    var localizedStrings = SpacedAppLocalizations.of(context);

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
                    const EdgeInsets.only(top: 56,bottom: 32, left: 44, right: 44),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AccentPillButton(localizedStrings.getStarted),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SignUpScreen(mainBloc),
                              ));
                        },
                        child: HollowPillButton(localizedStrings.signUp)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(mainBloc),
                            ));
                      },
                      child: Container(
                        // color: Colors.green,
                        padding: EdgeInsets.only(top: 6, bottom: 24),
                        child: Text(
                          '${localizedStrings.alreadyRegistered}',
                          style: TextStyle(fontSize: 12),
                        ),
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
