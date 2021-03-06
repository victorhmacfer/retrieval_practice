import 'package:flutter/material.dart';

import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/screens/login_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';
import 'package:retrieval_practice/custom_widgets/pill_button.dart';
import 'package:retrieval_practice/utils/app_i18n.dart';

import 'home_screen.dart';

class SignUpScreen extends StatelessWidget {
  final MainBloc mainBloc;

  SignUpScreen(this.mainBloc);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    var localizedStrings = SpacedAppLocalizations.of(context);

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
        // color: Colors.red,
        color: appWhite,
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                    backgroundImage: AssetImage('assets/images/launcher-icon-192.png'),
                    radius: 34,
                ),
                
                
                Container(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.07),
                  // color: Colors.red,
                  child: Text(
                    localizedStrings.signUpScreenTitle,
                    style: TextStyle(
                        color: Color.fromRGBO(23, 23, 23, 1),
                        fontSize: 36,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                MySignUpForm(mainBloc),
              ],
            ),
          ),
        
      ),
    );
  }
}

class MySignUpForm extends StatefulWidget {
  final MainBloc mainBloc;

  MySignUpForm(this.mainBloc);

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
    var screenHeight = MediaQuery.of(context).size.height;

    var localizedStrings = SpacedAppLocalizations.of(context);

    return Form(
      key: _signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: 140,
                child: TextFormField(
                  key: _firstNameKey,
                  controller: _firstNameController,
                  validator: (text) {
                    if (text.isEmpty) return localizedStrings.signUpFirstNameBlank;
                  },
                  onChanged: (_) {
                    _firstNameKey.currentState.validate();
                  },
                  style: TextStyle(color: appBlack),
                  decoration: InputDecoration(
                    hintText: localizedStrings.firstNameFormHintText,
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
                      borderSide: BorderSide(color: appFormErrorRed, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: appFormErrorRed, width: 2),
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
                    if (text.isEmpty) return localizedStrings.signUpLastNameBlank;
                  },
                  onChanged: (_) {
                    _lastNameKey.currentState.validate();
                  },
                  style: TextStyle(color: appBlack),
                  decoration: InputDecoration(
                    hintText: localizedStrings.lastNameFormHintText,
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
                      borderSide: BorderSide(color: appFormErrorRed, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: appFormErrorRed, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
            child: TextFormField(
              key: _emailKey,
              controller: _emailController,
              //FIXME: this validation is wrong !  Just providing one for now.
              // it accepts "victor@gmail" without a ".com"
              validator: (email) {
                if (!email.contains(RegExp(
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"))) {
                  return localizedStrings.invalidEmail;
                }
              },
              onChanged: (_) {
                _emailKey.currentState.validate();
              },
              style: TextStyle(color: appBlack),
              decoration: InputDecoration(
                //TODO: label is bugged ?  I will try to use it later
                hintText: localizedStrings.emailFormHintText,
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
              if (pwd.length < 8) return localizedStrings.passwordTooShort;
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
              hintText: localizedStrings.passwordFormHintText,
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
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(widget.mainBloc),
                  ));
            },
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.02,
                right: screenHeight * 0.03,
              ),
              child: Text(
                localizedStrings.alreadyRegistered,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          GestureDetector(
              onTap: () async {
                if (_signUpFormKey.currentState.validate()) {
                  var theFirstName = _firstNameController.text;
                  var theLastName = _lastNameController.text;
                  var theEmail = _emailController.text;
                  var thePassword = _passwordController.text;

                  var respStatus = await widget.mainBloc
                      .signUpWithEmailAndPassword(
                          theFirstName, theLastName, theEmail, thePassword);

                  if (respStatus == SignUpResponseStatus.SUCCESS) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(widget.mainBloc)),
                      (route) => false,
                    );
                  } else if (respStatus ==
                      SignUpResponseStatus.EMAIL_ALREADY_IN_USE) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 3),
                      content: Text(
                        localizedStrings.emailAlreadyInUse,
                        style: TextStyle(
                            fontSize: 16,
                            color: appWhite,
                            fontWeight: FontWeight.w500),
                      ),
                      backgroundColor: Colors.red[400],
                    ));
                  }
                }
              },
              child: AccentPillButton(localizedStrings.signUp.toUpperCase())),
              SizedBox(height: screenHeight * 0.45,),
        ],
      ),
    );
  }
}
