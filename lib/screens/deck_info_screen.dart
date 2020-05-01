import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';
import 'package:retrieval_practice/custom_widgets/question_tile.dart';
import 'package:retrieval_practice/models/studied_subject.dart';
import 'package:retrieval_practice/screens/create_question_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

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

  List<Widget> _questions() {
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
          'Você ainda não criou\n nenhuma pergunta!',
          style: noQuestionsYetTextStyle,
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
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
                Image.asset(
                  'assets/images/default-pic-better.jpg',
                  height: 216,
                  fit: BoxFit.fill,
                ),
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
                    children: _questions(),
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
