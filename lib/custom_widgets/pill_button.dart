
import 'package:flutter/material.dart';


class CardTotalPillButton extends StatelessWidget {

  int _totalOfCards;

  CardTotalPillButton(this._totalOfCards);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(72),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.folder_open, size: 25,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            //TODO: this should use actual data
            child: Text('24 cards', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
          ),
        ],
      ),
      
    );
  }
}


class CardsDuePillButton extends StatelessWidget {

  int _dueCards;

  CardsDuePillButton(this._dueCards);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(140, 200, 56, 56),
        borderRadius: BorderRadius.circular(72),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.timer_off, size: 25, color: Colors.red[200],),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            //TODO: this should use actual data
            child: Text('6 due', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.red[200]),),
          ),
        ],
      ),
      
    );
  }

  
}

