import 'package:flutter/material.dart';
import 'package:retrieval_practice/custom_widgets/deck.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print('I pressed the FAB.');
        },
      ),
      
      body: CustomScrollView(
        slivers: <Widget>[


          SliverAppBar(
              expandedHeight: 56.0,
              backgroundColor: Colors.black,
              floating: true,
              
              title: Text('Retrieval Practice'),
              centerTitle: true,
              
              ),

              SliverList(
          delegate: SliverChildBuilderDelegate(
            // (context, index) => ListTile(
            //       title: Text("List Item $index"),
            //     ),
            (context, index) => Deck(),
          ),
        ),





        ],
      ),
    );
  }
}
