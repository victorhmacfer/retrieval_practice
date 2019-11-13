import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/screens/deck_info_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class Deck extends StatelessWidget {
  final Subject _subject;

  final MainBloc _mainBloc;

  Deck(this._subject, this._mainBloc);

  @override
  Widget build(BuildContext context) {
    //TODO: this is temporary
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DeckInfoScreen(_subject, _mainBloc)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        height: 280,
        color: appBlack,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'assets/images/asian-woman.jpg',
                fit: BoxFit.fill,
              ),
              Positioned(
                  width: 360,
                  height: 88,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    color: appDarkGrey,
                    padding: EdgeInsets.all(16),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            _subject.title,
                            style: deckTitleTextStyle,
                          ),
                        ),
                        //TODO: when only one question it should say "1 question" not "1 questions"
                        Text(
                          '${_subject.totalNumOfQuestions} questions  |  ${_subject.numOfDueQuestions} due',
                          style: deckSubtitleTextStyle,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
