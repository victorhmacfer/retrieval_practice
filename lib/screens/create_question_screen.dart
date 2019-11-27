import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class CreateQuestionScreen extends StatefulWidget {
  final Subject subject;

  final MainBloc _mainBloc;

  CreateQuestionScreen(this.subject, this._mainBloc);

  @override
  _CreateQuestionScreenState createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  final myFrontController = TextEditingController();
  final myBackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
          child: Scaffold(
        appBar: AppBar(
          title: Text(widget.subject.title, style: deckTitleTextStyle,),
          backgroundColor: appDarkGrey,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 24),
              icon: Icon(
                Icons.check,
                size: 28,
              ),
              onPressed: () {
                widget._mainBloc
                    .onCreateNewQuestion(myFrontController.text, myBackController.text, widget.subject);
                Navigator.pop(context);
              },
            ),
          ],
          bottom: TabBar(
            indicatorColor: appBlue,
            labelPadding: EdgeInsets.all(16),
            tabs: <Widget>[
              Text('Front side'),
              Text('Back side'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _frontOrBackSide('Front', myFrontController),
            _frontOrBackSide('Back', myBackController),
          ],

        ),
      ),
    );
  }

  @override
  void dispose() {
    myFrontController.dispose();
    myBackController.dispose();
    super.dispose();
  }
}


Widget _frontOrBackSide(String message, aTextEditingcontroller) {
  return Container(
          padding: EdgeInsets.all(24),
          constraints: BoxConstraints.expand(),
          child: TextField(
            controller: aTextEditingcontroller,
            decoration: InputDecoration.collapsed(
                hintText: message,
                hintStyle: hintTextStyle),
            maxLines: 100,
            style: TextStyle(fontSize: 18),
          ),
        );
}
