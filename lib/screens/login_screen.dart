import 'package:flutter/material.dart';

import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/styles/my_styles.dart';
import 'package:retrieval_practice/custom_widgets/pill_button.dart';
import 'package:retrieval_practice/custom_widgets/auth_error_snackbar.dart';
import 'package:retrieval_practice/screens/home_screen.dart';
import 'package:retrieval_practice/utils/app_i18n.dart';

class LoginScreen extends StatelessWidget {
  final MainBloc mainBloc;

  LoginScreen(this.mainBloc);

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
        color: appWhite,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/launcher-icon-192.png'),
                  radius: 34,
                ),
                SizedBox(
                  height: screenHeight * 0.15,
                ),
                Text(
                  localizedStrings.loginScreenTitle,
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

    var localizedStrings = SpacedAppLocalizations.of(context);

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
              //This validation is wrong.. accepts "victor@gmail"
              // It is also duplicated in signup screen, but I dont see a GOOD way
              // to remove this duplication since the function needs access to
              // a SpacedAppLocalizations object and the expected signature
              // doesnt allow this extra parameter.
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
                hintText: localizedStrings.emailFormHintText,
                hintStyle: TextStyle(color: Colors.grey),
                fillColor: formFieldGrey,
                filled: true,
                focusedBorder: authFormFocusedBorder,
                enabledBorder: authFormEnabledBorder,
                errorBorder: authFormErrorBorder,
                focusedErrorBorder: authFormFocusedErrorBorder,
              ),
            ),
          ),
          TextFormField(
            key: _passwordKey,
            controller: _passwordController,
            //FIXME:  everything here is duplicated in signup screen
            validator: (pwd) {
              if (pwd.length < 8) return localizedStrings.passwordTooShort;
            },
            onChanged: (_) {
              _passwordKey.currentState.validate();
            },
            style: TextStyle(color: appBlack),
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
              focusedBorder: authFormFocusedBorder,
              enabledBorder: authFormEnabledBorder,
              errorBorder: authFormErrorBorder,
              focusedErrorBorder: authFormFocusedErrorBorder,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.02, right: screenHeight * 0.03),
            child: Text(
              localizedStrings.resetPassword,
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.06,
          ),
          GestureDetector(
              onTap: () async {
                if (_loginFormKey.currentState.validate()) {
                  var theEmail = _emailController.text;
                  var thePassword = _passwordController.text;

                  var respStatus = await widget.mainBloc
                      .loginWithEmailAndPassword(theEmail, thePassword);

                  if (respStatus == LoginResponseStatus.USER_NOT_FOUND) {
                    Scaffold.of(context).showSnackBar(
                        authErrorSnackBar(localizedStrings.loginEmailNotFound));
                  } else if (respStatus == LoginResponseStatus.WRONG_PASSWORD) {
                    Scaffold.of(context).showSnackBar(
                        authErrorSnackBar(localizedStrings.wrongPassword));
                  } else {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(widget.mainBloc)),
                      (route) => false,
                    );
                  }
                }
              },
              child: AccentPillButton(
                  localizedStrings.loginScreenTitle.toUpperCase())),
          SizedBox(
            height: screenHeight * 0.45,
          )
        ],
      ),
    );
  }
}
