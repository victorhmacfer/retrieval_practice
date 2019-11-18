import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/navigation.dart';
import 'package:retrieval_practice/screens/answer_question_screen.dart';

//TODO: fix styles and colors 
class DueQuestionsCard extends StatelessWidget {

  final MainBloc bloc;

  DueQuestionsCard(this.bloc);


  List<Widget> _answerScreens(List<Question> questions) {
    List<Widget> myList = [];
    for (var q in questions) {
      myList.add(AnswerQuestionScreen(q));
    }
    return myList;
  }


  @override
  Widget build(BuildContext context) {

    List<Question> myDueQuestions = bloc.allDueQuestions;
    for (var i in myDueQuestions) print(i.title);
    

    return GestureDetector(
      onTap: () {
        print('I pressed the blue button!');
        // pushManyWithOnlyOneAnimation(context, _answerScreens(myDueQuestions));
        pushWithoutAnimation(context, _answerScreens(myDueQuestions)[0]);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        height: 180,
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
                  Text('9', style: TextStyle(fontSize: 44),),
                  Text('  minutes'),
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
