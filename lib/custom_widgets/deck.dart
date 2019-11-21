import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/custom_widgets/deletion_modal.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/screens/deck_info_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class Deck extends StatelessWidget {
  final Subject _subject;

  final MainBloc _mainBloc;

  Deck(this._subject, this._mainBloc);

  @override
  Widget build(BuildContext context) {

    var totalNumOfQuestions = _subject.totalNumOfQuestions;
    var questionString = (totalNumOfQuestions > 1) ? 'questions' : 'question';


    //TODO: this is temporary
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              settings: RouteSettings(name: '/deckInfo'),
              builder: (context) => DeckInfoScreen(_subject, _mainBloc)),
        );
      },
      onLongPress: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: appDarkGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          builder: (myContext) => DeletionModal(subject: _subject, bloc: _mainBloc,),
        );
        print('I long pressed the deck.');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        height: 250,
        //this part is transparent..
        //color: appBlack,
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
                  height: 70,
                  bottom: 0,
                  left: 0,
                  child: Container(
                    color: appDarkGrey,
                    padding: EdgeInsets.only(top: 8, left: 16),
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
                        Text(
                          '$totalNumOfQuestions $questionString  |  ${_subject.numOfDueQuestions} due',
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
