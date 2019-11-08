import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/screens/deck_info_screen.dart';



// TODO: sizes are wrong for different resolutions
// TODO: change text to actual data
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
          MaterialPageRoute(builder: (context) => DeckInfoScreen(_subject, _mainBloc)),
        );
      },
      
          child: Container(
        padding: EdgeInsets.all(16.0),
        height: 280,
        color: Colors.black,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset('assets/images/asian-woman.jpg', fit: BoxFit.fill,),

              Positioned(
                width: 360,
                height: 88,
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.grey[800],
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          _subject.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      //TODO: when only one question it should say "1 question" not "1 questions"
                      Text(
                        '${_subject.totalNumOfQuestions} questions  |  ${_subject.numOfDueQuestions} due',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey
                        ),
                      ),
                      
                    ],
                  ),
                )
              ),



            ],
          ),
        ),
      ),
    );
  }
}

