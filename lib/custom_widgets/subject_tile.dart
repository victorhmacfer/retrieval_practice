


import 'package:flutter/material.dart';


//TODO: should use actual data
class SubjectTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.black,
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 16.0),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue[200],
              child: Text('6d'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('System Calls', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
              Text('edited 9 days ago', style: TextStyle(fontSize: 12, color: Colors.grey),),

            ],
          )

        ],
      ),
      
    );
  }
}