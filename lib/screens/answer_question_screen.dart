import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/models/studied_subject.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class AnswerQuestionScreen extends StatelessWidget {
  final Question question;
  final GestureTapCallback tapCallback;
  final StudiedSubject subject;
  final MainBloc bloc;

  AnswerQuestionScreen(
      {this.question, this.subject, this.bloc, this.tapCallback});

  Widget _answerButtonGrid(BuildContext ctxt, screenHeight, screenWidth) {
    return Container(
      height: screenHeight * 0.3,
      child: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 16),
        crossAxisCount: 3,
        children: <Widget>[
          _answerButton(ctxt, screenWidth, 0),
          _answerButton(ctxt, screenWidth, 1),
          _answerButton(ctxt, screenWidth, 2),
          _answerButton(ctxt, screenWidth, 3),
          _answerButton(ctxt, screenWidth, 4),
          _answerButton(ctxt, screenWidth, 5),
        ],
      ),
    );
  }

  Widget _answerButton(BuildContext ctxt, screenWidth, int number) {
    return GestureDetector(
      onTap: () {
        bloc.onAddStudy(question, subject, number);
        Navigator.pop(ctxt);
      },
      child: Container(
        color: appBlack,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          heightFactor: 0.7,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(235, 235, 235, 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              '$number',
              style: TextStyle(color: appGrey, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: tapCallback,
        ),
        title: Text(
          'Due cards',
          style: deckTitleTextStyle,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 16),
            icon: Icon(
              Icons.delete,
              size: 26,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight * 0.82,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextFormField(
                  initialValue: question.frontSide,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  //TODO: this maxLines should be changed later ! Just making it work for now
                  maxLines: 10,
                  style: TextStyle(fontSize: 18),
                ),
                _answerButtonGrid(context, screenHeight, screenWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
