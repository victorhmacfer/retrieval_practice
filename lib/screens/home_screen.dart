import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/custom_widgets/deck.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/screens/create_deck_screen.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/custom_widgets/due_questions_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mainBloc = BlocProvider.of<MainBloc>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateDeckScreen(mainBloc)),
          );
        },
      ),
      body: StreamBuilder<List<Subject>>(
          stream: mainBloc.subjectStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return Center(
                  child: Text('You have no decks yet...', style: deckTitleTextStyle,),
                );
              }

              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 56.0,
                    backgroundColor: appBlack,
                    floating: true,
                    title: Text('Retrieval Practice', style: appTitleTextStyle,),
                    centerTitle: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [Visibility(
                        visible: true,
                        child: DueQuestionsCard(),
                      )]
                    ),
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
