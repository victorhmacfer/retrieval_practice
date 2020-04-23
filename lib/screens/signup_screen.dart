import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/auth_bloc.dart';
import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';

import 'home_screen.dart';

class SignUpScreen extends StatelessWidget {
  final AuthBloc authBloc;
  final MainBloc mainBloc;

  SignUpScreen(this.authBloc, this.mainBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appWhite,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.clear,
              size: 28,
              color: appBlack,
            ),
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
                MySignUpForm(authBloc, mainBloc),
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
  final AuthBloc authBloc;
  final MainBloc mainBloc;

  MySignUpForm(this.authBloc, this.mainBloc);

  @override
  _MySignUpFormState createState() => _MySignUpFormState();
}

class _MySignUpFormState extends State<MySignUpForm> {
  final _signUpFormKey = GlobalKey<FormState>();

  final _firstNameKey = GlobalKey<FormFieldState>();
  final _lastNameKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
              children: <Widget>[
                SizedBox(
                  width: 140,
                  child: TextFormField(
                    key: _firstNameKey,
                    controller: _firstNameController,
                    validator: (text) {
                      if (text.isEmpty) return 'Please, tell us!';
                    },
                    onChanged: (_) {
                      _firstNameKey.currentState.validate();
                    },
                    style: TextStyle(color: appBlack),
                    decoration: InputDecoration(
                      hintText: 'First name',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: formFieldGrey,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide:
                            BorderSide(color: appAuthFormFieldBlue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: formFieldGrey, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide:
                            BorderSide(color: appFormErrorRed, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide:
                            BorderSide(color: appFormErrorRed, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: TextFormField(
                    key: _lastNameKey,
                    controller: _lastNameController,
                    validator: (text) {
                      if (text.isEmpty) return 'Please, tell us!';
                    },
                    onChanged: (_) {
                      _lastNameKey.currentState.validate();
                    },
                    style: TextStyle(color: appBlack),
                    decoration: InputDecoration(
                      hintText: 'Last name',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: formFieldGrey,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide:
                            BorderSide(color: appAuthFormFieldBlue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: formFieldGrey, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide:
                            BorderSide(color: appFormErrorRed, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide:
                            BorderSide(color: appFormErrorRed, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextFormField(
              key: _emailKey,
              controller: _emailController,
              //FIXME: this validation is wrong !  Just providing one for now.
              // it accepts "victor@gmail" without a ".com"
              validator: (email) {
                if (!email.contains(RegExp(
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"))) {
                  return 'Invalid email';
                }
              },
              onChanged: (_) {
                _emailKey.currentState.validate();
              },
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
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: appFormErrorRed, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: appFormErrorRed, width: 2),
                ),
              ),
            ),
          ),
          TextFormField(
            key: _passwordKey,
            controller: _passwordController,
            style: TextStyle(color: appBlack),
            validator: (pwd) {
              if (pwd.length < 8) return 'Must be at least 8 characters long.';
            },
            onChanged: (_) {
              _passwordKey.currentState.validate();
            },
            obscureText: true,
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
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(color: appFormErrorRed, width: 2),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(color: appFormErrorRed, width: 2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16, right: 24.0),
            child: Text(
              ' Already registered?',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          GestureDetector(
              onTap: () async {
                if (_signUpFormKey.currentState.validate()) {
                  // TODO:
                  var theEmail = _emailController.text;
                  var thePassword = _passwordController.text;
                  var user = await widget.authBloc
                      .signUpWithEmailAndPassword(theEmail, thePassword);

                  print(user.email);

                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        widget.authBloc, 
                        widget.mainBloc)),
                  );

                  
                  // if registering works.. log in with those credentials
                  //  push replacement  home screen
                }
              },
              child: AccentPillButton('SIGN UP')),
        ],
      ),
    );
  }
}
