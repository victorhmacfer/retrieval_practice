import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/screens/pick_cover_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class CreateDeckScreen extends StatefulWidget {
  final MainBloc mainBloc;

  const CreateDeckScreen(this.mainBloc);

  @override
  _CreateDeckScreenState createState() => _CreateDeckScreenState();
}

class _CreateDeckScreenState extends State<CreateDeckScreen> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create deck',
          style: deckTitleTextStyle,
        ),
        backgroundColor: appDarkGrey,
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 32),
            icon: Icon(
              Icons.check,
              color: appWhite,
              size: 30,
            ),
            onPressed: () {
              widget.mainBloc.onCreateNewSubject(myController.text);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(height: 400),
        color: appBlack,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 216,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/default-pic-better.jpg',
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                        right: 16,
                        bottom: 24,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    settings:
                                        RouteSettings(name: '/createQuestion'),
                                    builder: (context) => PickCoverScreen()));
                          },
                          child: Container(
                            height: 36,
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(32, 32, 32, 0.5),
                              // color: Colors.blue,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Text(
                              'Change image',
                              style: deckTitleTextStyle.copyWith(fontSize: 15),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                    controller: myController,
                    style: deckTitleTextStyleBigger,
                    cursorColor: appBlue,
                    showCursor: true,
                    cursorWidth: 3,
                    autofocus: true,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Untitled',
                      hintStyle: hintTextStyle.copyWith(fontSize: 28),
                    )),
              ),
            ],
          ),
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
