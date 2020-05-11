import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/deck_cover_photo.dart';
import 'package:retrieval_practice/models/local_photo_file.dart';
import 'package:retrieval_practice/screens/pick_cover_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';
import 'package:retrieval_practice/utils/app_i18n.dart';

class CreateDeckScreen extends StatefulWidget {
  final MainBloc mainBloc;

  const CreateDeckScreen(this.mainBloc);

  @override
  _CreateDeckScreenState createState() => _CreateDeckScreenState();
}

class _CreateDeckScreenState extends State<CreateDeckScreen> {
  final myController = TextEditingController();

  DeckCoverPhoto coverPhoto;

  String localPhotoFilePath;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    var localizedStrings = SpacedAppLocalizations.of(context);


    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizedStrings.createDeckTitle,
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
            //FIXME: this is AWFUL
            onPressed: () {
              if (localPhotoFilePath == null) {
                widget.mainBloc.onCreateNewSubject(myController.text);
              }
              else {
                widget.mainBloc.onCreateNewSubject(
                  myController.text, 
                  localPhotoFilePath: localPhotoFilePath
                );
              }
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(height: 400), //FIXME: hardcoded
        color: appBlack,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                // color: Colors.red,
                height: 248,
                child: Stack(
                  children: <Widget>[
                    StreamBuilder<LocalPhotoFile>(
                        stream: widget.mainBloc.photoFileStream,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Image.asset(
                              'assets/images/white-default-pic.jpg',
                              fit: BoxFit.fill,
                            );
                          }

                          localPhotoFilePath = snapshot.data.filePath;

                          return Image.file(
                            snapshot.data.photoFile,
                            fit: BoxFit.cover,
                            width: screenWidth,
                          );
                        }),
                    Positioned(
                        right: 16,
                        bottom: 24,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PickCoverScreen(
                                        bloc: widget.mainBloc)));
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
                              localizedStrings.changeImage,
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
                      hintText: localizedStrings.untitledHintText,
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
