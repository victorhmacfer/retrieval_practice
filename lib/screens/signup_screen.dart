import 'package:flutter/material.dart';

import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';



class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appWhite,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Icon(
            Icons.clear,
            size: 28,
            color: appBlack,
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: appWhite,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      color: appBlack,
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 32,
                ),
                MySignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




//TODO: create a custom decorated textformfield to be reused !

//TODO: fix appearance

class MySignUpForm extends StatefulWidget {
  @override
  _MySignUpFormState createState() => _MySignUpFormState();
}

class _MySignUpFormState extends State<MySignUpForm> {
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 140,
                  child: TextFormField(
                    style: TextStyle(color: appBlack),
                    decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left: 6),

                        hintText: 'First name',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: formFieldGrey,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: appAuthFormFieldBlue, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide:
                              BorderSide(color: formFieldGrey, width: 2),
                        )),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: TextFormField(
                    style: TextStyle(color: appBlack),
                    decoration: InputDecoration(
                        hintText: 'Last name',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: formFieldGrey,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(color: appAuthFormFieldBlue, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide:
                              BorderSide(color: formFieldGrey, width: 2),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextFormField(
              style: TextStyle(color: appBlack),
              decoration: InputDecoration(
                  //TODO: label is bugged ?  I will try to use it later
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: formFieldGrey,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: appAuthFormFieldBlue, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: formFieldGrey, width: 2),
                  )),
            ),
          ),
          TextFormField(
            style: TextStyle(color: appBlack),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  padding: const EdgeInsets.only(right: 24),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: formFieldGrey,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: appAuthFormFieldBlue, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: formFieldGrey, width: 2),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16, right: 24.0),
            child: Text(
              ' Already registered?',
              style: TextStyle(color: Colors.black),
            ),
          ),
          AccentPillButton('SIGN UP'),
        ],
      ),
    );
  }
}
