import 'package:flutter/material.dart';
import 'package:retrieval_practice/custom_widgets/pill_button.dart';
import 'package:retrieval_practice/custom_widgets/subject_tile.dart';

class DeckInfoScreen extends StatefulWidget {
  @override
  _DeckInfoScreenState createState() => _DeckInfoScreenState();
}

class _DeckInfoScreenState extends State<DeckInfoScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            pinned: true,
            title: Text('My Title'),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Image.asset(
                  'assets/images/asian-woman.jpg',
                  fit: BoxFit.fill,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  color: Colors.black,
                  height: 180,
                  width: 360,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'OS Concepts',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CardTotalPillButton(24),
                            CardsDuePillButton(24),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                myDivider(),

                //TODO: this should be a column with these children created from a list of models
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    children: <Widget>[
                      SubjectTile(),
                  SubjectTile(),
                  SubjectTile(),
                  SubjectTile(),
                  SubjectTile(),
                  SubjectTile(),
                  SubjectTile(),

                    ],
                  ),
                )




              ],
            ),
          ),
        ],
      ),
    );
  }
}

// var sunda = Container(
//   color: Colors.green,
//   height: 120,
// );

Widget myDivider() {
  return Container(
    height: 4,
    color: Colors.grey[800],
  );
}
