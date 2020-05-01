import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/studied_subject.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class CreateQuestionScreen extends StatefulWidget {
  final StudiedSubject subject;

  final MainBloc _mainBloc;

  CreateQuestionScreen(this.subject, this._mainBloc);

  @override
  _CreateQuestionScreenState createState() => _CreateQuestionScreenState();
}

class _CreateQuestionScreenState extends State<CreateQuestionScreen> {
  final myFrontController = TextEditingController();

  final myBackController = TextEditingController();
  FocusNode frontFocusNode;
  FocusNode backFocusNode;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    frontFocusNode = FocusNode();
    backFocusNode = FocusNode();
  }

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
            onTap: (index) {
              if (index == 0) {
                //FocusScope.of(context).unfocus();
                //backFocusNode.unfocus();
                
                FocusScope.of(context).requestFocus(frontFocusNode);
                // FocusScope.of(context).requestFocus(frontFocusNode);
              } else if (index == 1) {
                //FocusScope.of(context).unfocus();
                //frontFocusNode.unfocus();
                
                FocusScope.of(context).requestFocus(backFocusNode);
                
              }

            },
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
            _frontOrBackSide('Front', myFrontController, frontFocusNode),
            _frontOrBackSide('Back', myBackController, backFocusNode),
          ],

        ),
      ),
    );
  }

  @override
  void dispose() {
    myFrontController.dispose();
    myBackController.dispose();
    frontFocusNode.dispose();
    backFocusNode.dispose();
    super.dispose();
  }
}


Widget _frontOrBackSide(String message, aTextEditingcontroller, aFocusNode) {
  return Container(
          padding: EdgeInsets.all(24),
          constraints: BoxConstraints.expand(),
          child: TextField(
            showCursor: true,
            //autofocus: true,
            focusNode: aFocusNode,
            cursorColor: appBlue,
            controller: aTextEditingcontroller,
            decoration: InputDecoration.collapsed(
                hintText: message,
                hintStyle: hintTextStyle),
            maxLines: 100,
            style: TextStyle(fontSize: 18),
          ),
        );
}
