import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrieval_practice/blocs/auth_bloc.dart';
import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/custom_widgets/deck.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/screens/create_deck_screen.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/custom_widgets/due_questions_card.dart';

class HomeScreen extends StatelessWidget {

  final AuthBloc authBloc;
  final MainBloc mainBloc;

  HomeScreen(this.authBloc, this.mainBloc);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       settings: RouteSettings(name: '/createDeck'),
          //       builder: (context) => CreateDeckScreen(mainBloc)),
          // );
          authBloc.logout();
        },
      ),
      body: StreamBuilder<List<Subject>>(
          stream: mainBloc.subjectListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {

                return CustomScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 56,
                      backgroundColor: appBlack,
                      title: Text(
                        'Retrieval Practice',
                        style: appTitleTextStyle
                      ),
                      centerTitle: true,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Container(
                            height: screenHeight * 0.8, //FIXME: hardcoded.. 80% is meaningless just to make it work.
                            alignment: Alignment.center,
                            child: Container(
                              width: screenHeight * 0.25, //FIXME: weird
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text('No decks yet', style: deckTitleTextStyle),
                                  SizedBox(height: 10,),
                                  Text(
                                    'Create a deck of cards and it will show up here.',
                                    style: TextStyle(color: appLightGrey, fontSize: 15, height: 1.4),)
                                ],
                              ),
                            ),
                          );
                        }, childCount: 1
                      ),
                    ),
                  ],
                );

              }


              var numOfDueQuestions = mainBloc.allDueQuestions.length;
              var hasAnyDueQuestions = false;
              if (numOfDueQuestions > 0) hasAnyDueQuestions = true;

              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 56.0,
                    backgroundColor: appBlack,
                    floating: true,
                    title: Text(
                      'Retrieval Practice',
                      style: appTitleTextStyle,
                    ),
                    centerTitle: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate.fixed([
                      Visibility(
                        visible: hasAnyDueQuestions,
                        child: DueQuestionsCard(mainBloc),
                      )
                    ]),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Deck(snapshot.data[index], mainBloc);
                    }, childCount: snapshot.data.length),
                  ),
                ],
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
