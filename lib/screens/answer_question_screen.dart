import 'package:flutter/material.dart';

//TODO: use actual data
class AnswerQuestionScreen extends StatefulWidget {
  @override
  _AnswerQuestionScreenState createState() => _AnswerQuestionScreenState();
}

class _AnswerQuestionScreenState extends State<AnswerQuestionScreen> {


  double _answerGrade = 0;


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
              print('I pressed the delete question button.');
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
      // body: Container(
      //   color: Colors.red,
      //   padding: EdgeInsets.only(top: 24, right: 24, left: 24, bottom: 56),
      //   constraints: BoxConstraints.expand(),
      //   child: TextField(
      //     decoration: InputDecoration.collapsed(hintText: ''),
      //     maxLines: null,
      //     style: TextStyle(
      //       fontSize: 18
      //     ),
      //   ),
      // ),

      body: Container(
        color: Colors.red,
        padding: EdgeInsets.all(24),
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Container(
            //color: Colors.blue,
            height: 500,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: 'blablbalblablablablablblalblal',
                  decoration: InputDecoration.collapsed(hintText: ''),
                  maxLines: null,
                  style: TextStyle(fontSize: 18),
                ),

                SizedBox(height: 48,),


                Slider(
                  value: _answerGrade,
                  onChanged: (newValue) {
                    setState(() {
                      _answerGrade = newValue;
                    });
                  },
                  divisions: 5,
                  min: 0,
                  max: 5,
                  label: '${_answerGrade.toInt()}',
                )




              ],
            ),
          ),
        ),
      ),
    );
  }
}
