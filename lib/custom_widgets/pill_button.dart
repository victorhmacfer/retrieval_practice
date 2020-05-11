import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/models/studied_subject.dart';
import 'package:retrieval_practice/push_many.dart';
import 'package:retrieval_practice/screens/answer_question_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';
import 'package:retrieval_practice/utils/app_i18n.dart';

class CardTotalPillButton extends StatelessWidget {
  final int _totalOfCards;

  CardTotalPillButton(this._totalOfCards);

  @override
  Widget build(BuildContext context) {
    var cardOrCards = _totalOfCards > 1 ? ' cards' : ' card';

    return Container(
      height: 52,
      width: 150,
      decoration: BoxDecoration(
        color: appPillButtonGrey,
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
              '$_totalOfCards $cardOrCards',
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
  final StudiedSubject subject;
  final MainBloc bloc;

  CardsDuePillButton(this.subject, this.bloc)
      : _dueCards = subject.numOfDueQuestions;

  List<Widget> _answerScreens(BuildContext context, List<Question> questions) {
    List<Widget> myList = [];
    for (var aQuestion in questions) {
      myList.add(AnswerQuestionScreen(
        question: aQuestion,
        subject: subject,
        bloc: bloc,
        tapCallback: () {
          Navigator.popUntil(context, ModalRoute.withName('/deckInfo'));
        },
      ));
    }
    return myList;
  }

  @override
  Widget build(BuildContext context) {
    List<Question> myDueQuestions = subject.dueQuestions;

    var localizedStrings = SpacedAppLocalizations.of(context);

    var duePluralizationChoice = (myDueQuestions.length > 1) ? localizedStrings.duePlural : localizedStrings.due;

    return GestureDetector(
      onTap: () {
        pushMany(context, _answerScreens(context, myDueQuestions));
      },
      child: Container(
        height: 52,
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
                '$_dueCards $duePluralizationChoice',
                style:
                    pillButtonTextStyle.copyWith(color: appDueQuestionLightRed),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: fix shadows later
class AccentPillButton extends StatelessWidget {
  final String text;
  AccentPillButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 56,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 2, spreadRadius: 1, color: Color.fromARGB(255, 50, 50, 50))],
            gradient: LinearGradient(colors: [
              Color(0xFF2B7EDE),
              Color(0xFF3D54B9),
            ]),
            borderRadius: BorderRadius.circular(72),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}

class HollowPillButton extends StatelessWidget {
  final String text;
  HollowPillButton(this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(color: appWhite, width: 2),
            borderRadius: BorderRadius.circular(72),
          ),
          child: Center(
            child: Text(text,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
          )),
    );
  }
}
