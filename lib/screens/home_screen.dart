import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/custom_widgets/deck.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/screens/create_deck_screen.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/custom_widgets/due_questions_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainBloc mainBloc;

  @override
  void initState() {
    super.initState();
    mainBloc = BlocProvider.of<MainBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                settings: RouteSettings(name: '/createDeck'),
                builder: (context) => CreateDeckScreen(mainBloc)),
          );
        },
      ),
      body: StreamBuilder<List<Subject>>(
          stream: mainBloc.subjectListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return Center(
                  child: Text(
                    'You have no decks yet...',
                    style: deckTitleTextStyle,
                  ),
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
