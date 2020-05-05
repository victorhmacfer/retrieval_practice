import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/models/studied_subject.dart';
import 'package:retrieval_practice/screens/answer_question_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class QuestionTile extends StatelessWidget {
  final Question question;
  final StudiedSubject subject;
  final MainBloc bloc;

  QuestionTile(this.question, this.subject, this.bloc);

  Color _circleAvatarColor() {
    if (question.isDue) return appDueQuestionDarkRed;
    return appBlue;
  }

  Widget _circleAvatarContent() {
    if (question.isDue)
      return Icon(
        Icons.timer_off,
        size: 18,
        color: appDueQuestionLightRed,
      );
    return Text('${question.daysUntilNextStudyFromToday}d');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (question.isDue) {
          Navigator.push(
            context,
            MaterialPageRoute(
                settings: RouteSettings(name: '/answerQuestion'),
                builder: (context) => AnswerQuestionScreen(
                      question: question,
                      subject: subject,
                      bloc: bloc,
                      tapCallback: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName('/deckInfo'));
                      },
                    )),
          );
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("Not the time to review this one yet!"),
          ));
        }
      },
      onLongPress: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Do you really want to remove this question?'),
                content: Text('This action is IRREVERSIBLE.'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text('Yes'),
                    onPressed: () {
                      bloc.onDeleteQuestion(question, subject);
                      // The deck info screen does not update to handle the deletion
                      // of the question.. The only widget that knows about that
                      // deletion is the homescreen (which has a streambuilder for list of subjects).
                      // So I go back to homescreen so the user has to reopen the deck
                      // and then, see the correct deck info screen, now created with
                      // the updated subject (with question(s) deleted).
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        height: 80,
        color: appBlack,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 16.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: _circleAvatarColor(),
                child: _circleAvatarContent(),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    question.frontSide,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: deckTitleTextStyle.copyWith(fontSize: 18),
                  ),
                  Text('edited 9 days ago', style: deckSubtitleTextStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
