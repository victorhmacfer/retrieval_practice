import 'package:flutter/material.dart';

import 'package:retrieval_practice/models/question.dart';

import 'package:retrieval_practice/models/study.dart';


//TODO: use actual data
class AnswerQuestionScreen extends StatefulWidget {
  final Question _question;

  AnswerQuestionScreen(this._question);

  @override
  _AnswerQuestionScreenState createState() => _AnswerQuestionScreenState();
}

class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {

  double _answerQuality = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OS Concepts'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 16),
            icon: Icon(
              Icons.check,
              size: 28,
            ),
            onPressed: () {
              widget._question.addStudy(Study(_answerQuality.toInt(), DateTime.now()));
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
        //color: Colors.red,
        padding: EdgeInsets.all(24),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Container(
            //color: Colors.blue,
            height: 500,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: widget._question.title,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  //TODO: this maxLines should be changed later ! Just making it work for now
                  maxLines: 10,
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(height: 48,),

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
