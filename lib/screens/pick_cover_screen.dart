import 'package:flutter/material.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

class PickCoverScreen extends StatelessWidget {
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
                    labelText: "Search term",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                    )),
              ),
            )),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: appBlack,
        child: GridView.count(
          padding: EdgeInsets.all(12),
          childAspectRatio: 18/11,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          crossAxisCount: 3,
          children: List.generate(5, (index) {
            return _tinyImage();
          }),
        ),
      ),
    );
  }
}

Widget _tinyImage() {
  return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset('assets/images/asian-woman.jpg', fit: BoxFit.fill,),
    );
  
}

