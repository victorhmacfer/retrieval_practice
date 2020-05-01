import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/screens/first_screen_picker.dart';

const _usernameStyle =
    TextStyle(color: appWhite, fontSize: 14, fontWeight: FontWeight.w500);

const _emailStyle = TextStyle(color: Colors.grey, fontSize: 12);

// FIXME: hardcoded data
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
        // color: Colors.purple,
        padding: EdgeInsets.only(left: horizontalPadding),
        child: Icon(Icons.clear),
      ),
    );
  }

  Widget _avatarRow(String firstName, String lastName, String email) {
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.only(
          top: 28,
          bottom: 20,
          left: horizontalPadding,
          right: horizontalPadding),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 32,
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

  Widget _actionWithToggle(icon, textString) {
    return Container(
      // color: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: horizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              icon,
              SizedBox(
                width: 34,
              ),
              Text(textString),
            ],
          ),
          Container(
            // color: Colors.red,
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

  Widget _actionRow(icon, textString) {
    return Container(
      //this is the same color as the background but
      // containers with no color dont detect taps correctly
      color: appBlack,
      padding:
          EdgeInsets.symmetric(vertical: 15, horizontal: horizontalPadding),
      child: Row(
        children: <Widget>[
          icon,
          SizedBox(
            width: 34,
          ),
          Text(textString),
        ],
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 1,
        color: Color.fromRGBO(33, 33, 33, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(vertical: 44),
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
                    return _avatarRow(firstName, lastName, email);
                  }
                  return CircularProgressIndicator();
                }),

                
            _actionWithToggle(Icon(Icons.brightness_3), 'Dark theme'),
            _actionRow(Icon(Icons.settings), 'Preferences'),
            _actionRow(Icon(Icons.import_export), 'Import/Export'),
            _divider(),
            _actionRow(Icon(Icons.feedback), 'Send feedback'),
            _actionRow(Icon(Icons.star_border), 'Rate us'),
            _actionRow(Icon(Icons.event_note), 'Privacy Policy'),
            _actionRow(Icon(Icons.info_outline), 'About Spaced'),
            _divider(),
            GestureDetector(
                onTap: () async {
                  print('clicked on logout tile');
                  await widget.mainBloc.logout();
                  Navigator.pushAndRemoveUntil(
                    context,
                    //giving it a new bloc.
                    MaterialPageRoute(
                        builder: (context) => FirstScreenPicker(MainBloc())),
                    (route) => false,
                  );
                },
                child: _actionRow(Icon(Icons.input), 'Log out')),
          ],
        ),
      ),
    );
  }
}
