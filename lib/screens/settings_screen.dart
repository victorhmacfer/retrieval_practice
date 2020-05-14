import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/screens/first_screen_picker.dart';
import 'package:retrieval_practice/utils/app_i18n.dart';

const _usernameStyle =
    TextStyle(color: appWhite, fontSize: 14, fontWeight: FontWeight.w500);

const _emailStyle = TextStyle(color: Colors.grey, fontSize: 12);


class SettingsScreen extends StatefulWidget {
  final MainBloc mainBloc;

  SettingsScreen(this.mainBloc);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final double horizontalPadding = 16;

  bool darkThemeEnabled = false;

  Widget _backIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.only(left: horizontalPadding),
        child: Icon(Icons.clear),
      ),
    );
  }

  Widget _avatarRow(String firstName, String lastName, String email,
      screenHeight, screenWidth) {
    return Container(
      padding: EdgeInsets.only(
          top: screenHeight * 0.033,
          bottom: screenHeight * 0.024,
          left: horizontalPadding,
          right: horizontalPadding),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: screenWidth * 0.078,
            foregroundColor: appWhite,
            child: Text(
              firstName[0].toUpperCase(),
              style: TextStyle(fontSize: 28),
            ),
            backgroundColor: Color.fromRGBO(41, 105, 81, 1),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('$firstName $lastName', style: _usernameStyle),
              Text(
                email,
                style: _emailStyle,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _actionWithToggle(icon, textString, screenHeight, screenWidth) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              icon,
              SizedBox(
                width: screenWidth * 0.083,
              ),
              Text(textString),
            ],
          ),
          Container(
            child: Switch(
                activeColor: appBlue,
                value: darkThemeEnabled,
                onChanged: (newValue) {
                  setState(() {
                    darkThemeEnabled = newValue;
                  });
                }),
          ),
        ],
      ),
    );
  }

  Widget _actionRow(icon, textString, screenHeight, screenWidth) {
    return Container(
      //this is the same color as the background but
      // containers with no color dont detect taps correctly
      color: appBlack,
      padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.018, horizontal: horizontalPadding),
      child: Row(
        children: <Widget>[
          icon,
          SizedBox(
            width: screenWidth * 0.083,
          ),
          Text(textString),
        ],
      ),
    );
  }

  Widget _divider(screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.012),
      child: Container(
        height: 1,
        color: Color.fromRGBO(33, 33, 33, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    var localizedStrings = SpacedAppLocalizations.of(context);

    return Material(
      child: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.only(top: screenHeight * 0.052),
        color: appBlack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _backIcon(context),
            StreamBuilder(
                stream: widget.mainBloc.appUserStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var firstName = snapshot.data.firstName;
                    var lastName = snapshot.data.lastName;
                    var email = snapshot.data.email;
                    return _avatarRow(
                        firstName, lastName, email, screenHeight, screenWidth);
                  }
                  return CircularProgressIndicator();
                }),
            _actionWithToggle(Icon(Icons.brightness_3),
                localizedStrings.darkTheme, screenHeight, screenWidth),
            _actionRow(Icon(Icons.settings), localizedStrings.preferences,
                screenHeight, screenWidth),
            _actionRow(Icon(Icons.import_export), localizedStrings.importExport,
                screenHeight, screenWidth),
            _divider(screenHeight),
            _actionRow(Icon(Icons.feedback), localizedStrings.sendFeedback,
                screenHeight, screenWidth),
            _actionRow(Icon(Icons.star_border), localizedStrings.rateUs,
                screenHeight, screenWidth),
            _actionRow(Icon(Icons.event_note), localizedStrings.privacyPolicy,
                screenHeight, screenWidth),
            _actionRow(Icon(Icons.info_outline), localizedStrings.aboutTheApp,
                screenHeight, screenWidth),
            _divider(screenHeight),
            GestureDetector(
                onTap: () async {
                  await widget.mainBloc.logout();
                  Navigator.pushAndRemoveUntil(
                    context,
                    //giving it a new bloc.
                    MaterialPageRoute(
                        builder: (context) => FirstScreenPicker(MainBloc())),
                    (route) => false,
                  );
                },
                child: _actionRow(
                    Icon(Icons.input),
                    localizedStrings.settingsLogout,
                    screenHeight,
                    screenWidth)),
          ],
        ),
      ),
    );
  }
}
