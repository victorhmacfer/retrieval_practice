import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/auth_bloc.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final AuthBloc authBloc;
  final MainBloc mainBloc;

  LoginScreen(this.authBloc, this.mainBloc);

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
                  height: 150,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color: appBlack,
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 32,
                ),
                MyLoginForm(authBloc, mainBloc),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyLoginForm extends StatefulWidget {
  final AuthBloc authBloc;
  final MainBloc mainBloc;

  MyLoginForm(this.authBloc, this.mainBloc);

  @override
  _MyLoginFormState createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextFormField(
              key: _emailKey,
              controller: _emailController,
              //FIXME: this validation is wrong AND duplicated in signupscreen
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
                    borderSide:
                        BorderSide(color: appAuthFormFieldBlue, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: formFieldGrey, width: 2),
                  )),
            ),
          ),
          TextFormField(
            key: _passwordKey,
            controller: _passwordController,
            //FIXME:  everything here is duplicated in signup screen
            validator: (pwd) {
              if (pwd.length < 8) return 'Must be at least 8 characters long.';
            },
            onChanged: (_) {
              _passwordKey.currentState.validate();
            },
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
                  borderSide: BorderSide(color: Color(0xFF2B7EDE), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: formFieldGrey, width: 2),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16, right: 24.0),
            child: Text(
              ' Reset password',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          GestureDetector(
              onTap: () async {
                if (_loginFormKey.currentState.validate()) {
                  var theEmail = _emailController.text;
                  var thePassword = _passwordController.text;

                  var respStatus = await widget.authBloc
                      .loginWithEmailAndPassword(theEmail, thePassword);

                  if (respStatus == LoginResponseStatus.USER_NOT_FOUND) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text(
                        "We couldn't find a user with this email!",
                        style: TextStyle(
                            fontSize: 16,
                            color: appWhite,
                            fontWeight: FontWeight.w500),
                      ),
                      backgroundColor: Colors.red[400],
                    ));
                  } else if (respStatus == LoginResponseStatus.WRONG_PASSWORD) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text(
                        "Wrong password!",
                        style: TextStyle(
                            fontSize: 16,
                            color: appWhite,
                            fontWeight: FontWeight.w500),
                      ),
                      backgroundColor: Colors.red[400],
                    ));
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(widget.authBloc, widget.mainBloc)),
                      (route) => false,
                    );
                  }
                }
              },
              child: AccentPillButton('LOGIN')),
        ],
      ),
    );
  }
}
