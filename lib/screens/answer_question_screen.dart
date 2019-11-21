import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class AnswerQuestionScreen extends StatefulWidget {
  final Question question;
  final GestureTapCallback tapCallback;
  final Subject subject;
  final MainBloc bloc;

  AnswerQuestionScreen(
      {this.question, this.subject, this.bloc, this.tapCallback});

  @override
  _AnswerQuestionScreenState createState() => _AnswerQuestionScreenState();
}

class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {
  double _answerQuality = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: widget.tapCallback,
        ),
        title: Text(
          'OS Concepts',
          style: deckTitleTextStyle,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 16),
            icon: Icon(
              Icons.check,
              size: 28,
            ),
            onPressed: () {
              print('Este eh o nome da question: ${widget.question.title}');
              widget.bloc.onAddStudy(
                  widget.question, widget.subject, _answerQuality.toInt());
              Navigator.pop(context);
            },
          ),
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 16),
            icon: Icon(
              Icons.delete,
              size: 26,
            ),
            onPressed: () {
              print('I pressed the delete question button.');
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(24),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Container(
            height: 500,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: widget.question.title,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  //TODO: this maxLines should be changed later ! Just making it work for now
                  maxLines: 10,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 48,
                ),
                Slider(
                  value: _answerQuality,
                  onChanged: (newValue) {
                    setState(() {
                      _answerQuality = newValue;
                    });
                  },
                  divisions: 5,
                  min: 0,
                  max: 5,
                  label: '${_answerQuality.toInt()}',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
