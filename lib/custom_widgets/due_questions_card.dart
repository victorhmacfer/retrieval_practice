import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/navigation.dart';
import 'package:retrieval_practice/screens/answer_question_screen.dart';

//TODO: fix styles and colors
class DueQuestionsCard extends StatelessWidget {
  final MainBloc bloc;

  DueQuestionsCard(this.bloc);

  List<Widget> _answerScreens(BuildContext context, List<dynamic> questions) {
    List<Widget> myList = [];
    for (var aList in questions) {
      myList.add(AnswerQuestionScreen(
        question: aList[0],
        subject: aList[1],
        bloc: bloc,
        tapCallback: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
      ));
    }
    return myList;
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> myDueQuestions = bloc.allDueQuestions;

    return GestureDetector(
      onTap: () {
        print('I pressed the blue button!');
        pushMany(context, _answerScreens(context, myDueQuestions));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        height: 160,
        //color: Colors.red,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('DUE QUESTIONS'),
              Row(
                children: <Widget>[
                  Text(
                    '${myDueQuestions.length}',
                    style: TextStyle(fontSize: 44),
                  ),
                  Text('  cards'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.timer),
                      Text('2 minutes'),
                    ],
                  ),
                  Text('LEARN'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
