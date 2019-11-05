import 'package:flutter/material.dart';
import 'package:retrieval_practice/screens/deck_info_screen.dart';



// TODO: sizes are wrong for different resolutions
// TODO: change text to actual data
class Deck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //TODO: this is temporary
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DeckInfoScreen()),
        );
      },
          child: Container(
        padding: EdgeInsets.all(16.0),
        height: 280,
        color: Colors.black,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset('assets/images/asian-woman.jpg', fit: BoxFit.fill,),

              Positioned(
                width: 360,
                height: 88,
                bottom: 0,
                left: 0,
                child: Container(
                  color: Colors.grey[800],
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'OS Concepts',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      //TODO: interpolate data inside this string
                      Text(
                        '24 cards  |  6 due',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey
                        ),
                      ),
                      
                    ],
                  ),
                )
              ),



            ],
          ),
        ),
      ),
    );
  }
}

var sunda = Container(
  padding: EdgeInsets.all(16.0),
  color: Colors.blue,
  height: 16,
  child: Container(
    //color: Colors.red,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.red),
    child: Stack(
      children: <Widget>[
        Image.asset('assets/images/asian-woman.jpg'),
      ],
    ),
  ),
);
