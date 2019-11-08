
import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/screens/answer_question_screen.dart';


//TODO: should use actual data
class QuestionTile extends StatelessWidget {

  final Question _question;

  

  QuestionTile(this._question);

  Color _circleAvatarColor() {
    if (_question.isDue) return Color.fromARGB(140, 200, 56, 56);

    return Colors.blue[200];
  }

  Widget _circleAvatarContent() {
    if (_question.isDue) return Icon(Icons.timer_off, color: Colors.red[200],);

    return Text('${_question.daysUntilNextStudyFromToday}d');
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_question.isDue) {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnswerQuestionScreen(_question)),
        );
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Not the time to review this one yet!"),));
        }
      },
      onLongPress: () {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text('Do you really want to remove this question?'),
            content: Text('This action is irreversible.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  //Navigator.pop(context);
                },
              ),

              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  //Navigator.pop(context);
                },
              ),
            ],
            

          );
        });
      },
          child: Container(
        height: 80,
        color: Colors.black,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 16.0),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: _circleAvatarColor(),
                child: _circleAvatarContent(),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(_question.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                Text('edited 9 days ago', style: TextStyle(fontSize: 12, color: Colors.grey),),

              ],
            )

          ],
        ),
        
      ),
    );
  }
}