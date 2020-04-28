import 'package:flutter/material.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

const _usernameStyle =
    TextStyle(color: appWhite, fontSize: 14, fontWeight: FontWeight.w500);

const _emailStyle = TextStyle(color: Colors.grey, fontSize: 12);

// FIXME: hardcoded data
class SettingsScreen extends StatefulWidget {
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

  Widget _avatarRow() {
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
              'V',
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
              Text('victor ferreira', style: _usernameStyle),
              Text(
                'engvhmf@poli.ufrj.br',
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
      // color: Colors.yellow,
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
            _avatarRow(),
            _actionWithToggle(Icon(Icons.brightness_3), 'Dark theme'),
            _actionRow(Icon(Icons.settings), 'Preferences'),
            _actionRow(Icon(Icons.import_export), 'Import/Export'),
            _divider(),
            _actionRow(Icon(Icons.feedback), 'Send feedback'),
            _actionRow(Icon(Icons.star_border), 'Rate us'),
            _actionRow(Icon(Icons.event_note), 'Privacy Policy'),
            _actionRow(Icon(Icons.info_outline), 'About Spaced'),
            _divider(),
            _actionRow(Icon(Icons.input), 'Log out'),
          ],
        ),
      ),
    );
  }
}
