import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/subject.dart';

//TODO: use actual data
class CreateQuestionScreen extends StatefulWidget {
  final Subject subject;

  final MainBloc _mainBloc;

  CreateQuestionScreen(this.subject, this._mainBloc);

  @override
  _CreateQuestionScreenState createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {


  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 24),
            icon: Icon(
              Icons.check,
              size: 28,
            ),
            onPressed: () {
              print('I pressed the new question button.');
              widget._mainBloc.onCreateNewQuestion(myController.text, widget.subject);
              Navigator.pop(context);
            },
          ),
        ],
      ),

      //TODO: I want to be able to tap anywhere in this container to start typing on the textfield
      body: Container(
        //color: Colors.red,
        padding: EdgeInsets.all(24),
        constraints: BoxConstraints.expand(),
        child: TextField(
          controller: myController,
          decoration: InputDecoration.collapsed(
              hintText: 'What do you want to remember forever?'),
          maxLines: 100,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }


  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }



}
