import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/models/deck_cover_photo.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class PickCoverScreen extends StatefulWidget {

  final MainBloc bloc;
  PickCoverScreen({this.bloc});

  @override
  _PickCoverScreenState createState() => _PickCoverScreenState();
}

class _PickCoverScreenState extends State<PickCoverScreen> {
  @override
  Widget build(BuildContext context) {
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
          'Pick cover',
          style: deckTitleTextStyle,
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: Container(
              padding: EdgeInsets.all(16),
              height: 90,
              //color: Colors.green[800],
              child: TextField(
                autofocus: true,
                cursorColor: appBlue,
                style: TextStyle(
                  fontSize: 16,
                ),
                onEditingComplete: () {
                  widget.bloc.onCoverPhotoSearchSubmitted('banana');
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
                    labelText: "Search term",
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
            if (snapshot.data.isEmpty) {
              return Center(
                  child: Text(
                    'An error occurred while searching for your image.',
                    style: deckTitleTextStyle,
                  ),
                );
            }

            return Container(
            constraints: BoxConstraints.expand(),
            color: appBlack,
            child: GridView.count(
              padding: EdgeInsets.all(12),
              childAspectRatio: 18/11,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              crossAxisCount: 3,
              children: List.generate(snapshot.data.length, (index) {
                // use index to grab photo in snapshot.data[index]
                var myDeckPhoto = snapshot.data[index];

                // create widget from this deckCoverPhoto

                return _tinyImage(myDeckPhoto);
              }),
            ),
          );

          }

          return Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}

Widget _tinyImage(DeckCoverPhoto photo) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      // child: Image.asset('assets/images/asian-woman.jpg', fit: BoxFit.fill,),
      child: Image.network(photo.url, fit: BoxFit.fill),
    );
  
}

