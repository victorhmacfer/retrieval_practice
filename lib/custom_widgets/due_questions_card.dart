import 'package:flutter/material.dart';

//TODO: fix styles and colors 
class DueQuestionsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('I pressed the blue button!');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        height: 180,
        //color: Colors.red,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('DUE QUESTIONS'),
              Row(
                children: <Widget>[
                  Text('9', style: TextStyle(fontSize: 44),),
                  Text('  minutes'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.timer),
                      Text('2 minutes'),
                    ],
                  ),
                  Text('LEARN'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
