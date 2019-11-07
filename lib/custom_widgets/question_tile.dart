
import 'package:flutter/material.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/screens/answer_question_screen.dart';


//TODO: should use actual data
class QuestionTile extends StatelessWidget {

  final Question _question;

  QuestionTile(this._question);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnswerQuestionScreen()),
        );
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
                backgroundColor: Colors.blue[200],
                child: Text('6d'),
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