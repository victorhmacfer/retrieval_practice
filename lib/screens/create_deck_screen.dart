import 'package:flutter/material.dart';



class CreateDeckScreen extends StatefulWidget {
  @override
  _CreateDeckScreenState createState() => _CreateDeckScreenState();
}

class _CreateDeckScreenState extends State<CreateDeckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create deck'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 32),
            icon: Icon(Icons.check, color: Colors.blue[200], size: 30,),
            onPressed: () {
              print('I pressed check button.');
            },
          )
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(height: 400),
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/asian-woman.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                cursorColor: Colors.blue[200],
                showCursor: true,
                cursorWidth: 3,
                autofocus: true,
                decoration: InputDecoration.collapsed(hintText: 'Untitled',),
                style: TextStyle(fontSize: 30),

              ),
            ),
          ],
        ),
          
        ),


      ),
    );
  }
}