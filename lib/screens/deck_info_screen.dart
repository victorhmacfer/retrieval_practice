import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';
import 'package:retrieval_practice/custom_widgets/question_tile.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/screens/answer_question_screen.dart';
import 'package:retrieval_practice/screens/create_question_screen.dart';


class DeckInfoScreen extends StatefulWidget {

  final Subject _subject;

  final MainBloc _mainBloc;

  const DeckInfoScreen(this._subject, this._mainBloc);

  @override
  _DeckInfoScreenState createState() => _DeckInfoScreenState();
}

class _DeckInfoScreenState extends State<DeckInfoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  List<Widget> _questions() {
    var questionsList = widget._subject.questions;

    if (questionsList.isNotEmpty) {
      return questionsList.map((q) => QuestionTile(q)).toList();
    }

    return [
      Container(
        alignment: Alignment.center,
        //color: Colors.blue,
        constraints: BoxConstraints.expand(height: 200),
        padding: EdgeInsets.all(32),
        height: 300,
        width: 140,
        child: Text(
          'Você ainda não criou nenhuma pergunta!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
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
          print('I pressed the FAB.');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateQuestionScreen(widget._subject, widget._mainBloc)));
        },
      ),

      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 56.0,
            backgroundColor: Colors.black,
            pinned: true,
            title: Text(widget._subject.title),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Image.asset(
                  'assets/images/asian-woman.jpg',
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.black,
                  height: 180,
                  width: 360,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          widget._subject.title,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CardTotalPillButton(widget._subject.totalNumOfQuestions),
                            CardsDuePillButton(widget._subject.numOfDueQuestions),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                myDivider(),

                //TODO: this should be a column with these children created from a list of models
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: _questions(),
                  ),
                )




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
    color: Colors.grey[800],
  );
}
