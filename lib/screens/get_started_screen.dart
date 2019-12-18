import 'package:flutter/material.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';



//TODO: fix appearance  and use styles
class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment(0, 1.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/images/woman-in-black-top-480-854.jpg'))),
        child: Container(
          //color: Colors.red,
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AccentPillButton('GET STARTED'),
              HollowPillButton(),
              Text('Already registered ?'),
            ],
          ),
        ),
      ),
    );
  }
}