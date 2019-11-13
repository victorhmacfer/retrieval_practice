import 'package:flutter/material.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class CardTotalPillButton extends StatelessWidget {
  final int _totalOfCards;

  CardTotalPillButton(this._totalOfCards);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        color: appGrey,
        borderRadius: BorderRadius.circular(72),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.folder_open,
            size: 25,
            color: appWhite,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '$_totalOfCards cards',
              style: pillButtonTextStyle.copyWith(color: appWhite),
            ),
          ),
        ],
      ),
    );
  }
}

class CardsDuePillButton extends StatelessWidget {
  final int _dueCards;

  CardsDuePillButton(this._dueCards);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        color: appDueQuestionDarkRed,
        borderRadius: BorderRadius.circular(72),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.timer_off,
            size: 25,
            color: appDueQuestionLightRed,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '$_dueCards due',
              style: pillButtonTextStyle.copyWith(color: appDueQuestionLightRed),
            ),
          ),
        ],
      ),
    );
  }
}
