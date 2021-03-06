import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/deck_cover_photo.dart';
import 'package:retrieval_practice/styles/my_styles.dart';
import 'package:retrieval_practice/utils/app_i18n.dart';

class PickCoverScreen extends StatefulWidget {
  final MainBloc bloc;
  PickCoverScreen({this.bloc});

  @override
  _PickCoverScreenState createState() => _PickCoverScreenState();
}

class _PickCoverScreenState extends State<PickCoverScreen> {
  TextEditingController myController = TextEditingController();
  //FocusNode myFocusNode;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    //myFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    var localizedStrings = SpacedAppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBlack,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.clear)),
        title: Text(
          localizedStrings.pickCoverTitle,
          style: deckTitleTextStyle,
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: Container(
              padding: EdgeInsets.all(16),
              height: 90,
              //color: Colors.green[800],
              child: TextField(
                //focusNode: myFocusNode,
                controller: myController,
                autofocus: true,
                cursorColor: appBlue,
                style: TextStyle(
                  fontSize: 16,
                ),
                onEditingComplete: () {
                  setState(() {
                    isLoading = true;
                  });
                  widget.bloc.onCoverPhotoSearchSubmitted(myController.text);
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: appBlue),
                    enabledBorder: OutlineInputBorder(
                      //borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(color: appBlue, width: 2),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: appBlue,
                    ),
                    suffixIcon: Icon(
                      Icons.send,
                      color: appBlue,
                    ),
                    labelText: localizedStrings.pickCoverSearchFieldLabel,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    )),
              ),
            )),
      ),
      body: StreamBuilder<List<DeckCoverPhoto>>(
          stream: widget.bloc.deckCoverPhotoListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print('snapshot has data');
              isLoading = false;
              if (snapshot.data.isEmpty) {
                return Container(
                  //color: Colors.red,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'An error occurred when\nsearching for your image.',
                    textAlign: TextAlign.center,
                    style: deckTitleTextStyle.copyWith(
                        color: appWhite, height: 1.5, fontSize: 19),
                  ),
                );
              }
              return Container(
                constraints: BoxConstraints.expand(),
                color: appBlack,
                child: GridView.count(
                  padding: EdgeInsets.all(12),
                  childAspectRatio: 18 / 11,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  crossAxisCount: 3,
                  children: List.generate(snapshot.data.length, (index) {
                    var myDeckPhoto = snapshot.data[index];
                    return _tinyImage(context, myDeckPhoto, widget.bloc);
                  }),
                ),
              );
            }

            if (isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          }),
    );
  }
}

Widget _tinyImage(BuildContext ctxt, DeckCoverPhoto photo, MainBloc theBloc) {
  return GestureDetector(
    onTap: () {
      theBloc.onCoverPhotoChosen(photo);
      Navigator.pop(ctxt);
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network(photo.url, fit: BoxFit.cover),
    ),
  );
}
