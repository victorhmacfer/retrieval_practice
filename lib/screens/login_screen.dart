import 'package:flutter/material.dart';
// import 'package:retrieval_practice/blocs/auth_bloc.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {

  final MainBloc mainBloc;

  LoginScreen(this.mainBloc);

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;


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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: screenHeight * 0.2,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color: appBlack,
                      fontSize: 36,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                MyLoginForm(mainBloc),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyLoginForm extends StatefulWidget {
  
  final MainBloc mainBloc;

  
  MyLoginForm(this.mainBloc);

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

    var screenHeight = MediaQuery.of(context).size.height;

    return Form(
      key: _loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
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
            padding: EdgeInsets.only(
              top: screenHeight * 0.02, 
              right: screenHeight * 0.03
            ),
            child: Text(
              ' Reset password',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.06,
            // height: screenHeight * 0.15,
          ),
          GestureDetector(
              onTap: () async {
                if (_loginFormKey.currentState.validate()) {
                  var theEmail = _emailController.text;
                  var thePassword = _passwordController.text;

                  var respStatus = await widget.mainBloc
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
                              HomeScreen(widget.mainBloc)),
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
