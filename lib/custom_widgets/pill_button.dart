import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/navigation.dart';
import 'package:retrieval_practice/screens/answer_question_screen.dart';
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
  final Subject subject;
  final MainBloc bloc;

  CardsDuePillButton(this.subject, this.bloc) : _dueCards = subject.numOfDueQuestions;


  List<Widget> _answerScreens(BuildContext context, List<Question> questions) {
    List<Widget> myList = [];
    for (var aQuestion in questions) {
      myList.add(AnswerQuestionScreen(question: aQuestion, subject: subject, bloc: bloc, tapCallback: () {
        Navigator.popUntil(context, ModalRoute.withName('/deckInfo'));
      },));
    }
    return myList;
  }

  @override
  Widget build(BuildContext context) {
    List<Question> myDueQuestions = subject.dueQuestions;

    return GestureDetector(
      onTap: () {
        pushMany(context, _answerScreens(context, myDueQuestions));
      },
      child: Container(
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
      ),
    );
  }
}
