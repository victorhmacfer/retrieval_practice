import 'dart:io';

import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';
import 'package:retrieval_practice/custom_widgets/question_tile.dart';
import 'package:retrieval_practice/models/studied_subject.dart';
import 'package:retrieval_practice/screens/create_question_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';
import 'package:retrieval_practice/utils/app_i18n.dart';

class DeckInfoScreen extends StatefulWidget {
  final StudiedSubject _subject;

  final MainBloc _mainBloc;

  const DeckInfoScreen(this._subject, this._mainBloc);

  @override
  _DeckInfoScreenState createState() => _DeckInfoScreenState();
}

class _DeckInfoScreenState extends State<DeckInfoScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> _questions(noQuestionsText) {
    var questionsList = widget._subject.questions;

    if (questionsList.isNotEmpty) {
      return questionsList
          .map((q) => QuestionTile(q, widget._subject, widget._mainBloc))
          .toList();
    }
    return [
      Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(height: 200),
        padding: EdgeInsets.all(32),
        height: 300,
        width: 120,
        child: Text(
          noQuestionsText,
          style: noQuestionsYetTextStyle,
        ),
      )
    ];
  }

  // FIXME: this is absolute trash..
  Widget _imageWidget(StudiedSubject _sub, double screenHeight) {
    if (_sub.deckPhotoPath == 'default') {
      return Image.asset(
        'assets/images/white-default-pic.jpg',
        height: screenHeight * 0.29,
        fit: BoxFit.fill,
      );
    }
    var photoFile = File(_sub.deckPhotoPath);
    return Image.file(
      photoFile,
      height: screenHeight * 0.29,
      fit: BoxFit.fill,);
  }

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;

    var localizedStrings = SpacedAppLocalizations.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  settings: RouteSettings(name: '/createQuestion'),
                  builder: (context) =>
                      CreateQuestionScreen(widget._subject, widget._mainBloc)));
        },
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 56.0,
            backgroundColor: appDarkGrey,
            pinned: true,
            title: Text(
              widget._subject.title,
              style: deckTitleTextStyle,
            ),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _imageWidget(widget._subject, screenHeight),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  color: appBlack,
                  height: 165,
                  width: 360,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(widget._subject.title,
                            style: deckTitleTextStyleBigger),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CardTotalPillButton(
                                widget._subject.totalNumOfQuestions),
                            CardsDuePillButton(widget._subject, widget._mainBloc),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                myDivider(),
                Container(
                  color: appBlack,
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: _questions(localizedStrings.deckInfoNoQuestionsYet),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget myDivider() {
  return Container(
    height: 4,
    color: Color.fromRGBO(33, 33, 33, 1),
  );
}
