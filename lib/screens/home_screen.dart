import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrieval_practice/custom_widgets/deck.dart';
import 'package:retrieval_practice/models/studied_subject.dart';
import 'package:retrieval_practice/screens/create_deck_screen.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';
import 'package:retrieval_practice/screens/settings_screen.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

import 'package:retrieval_practice/custom_widgets/due_questions_card.dart';
import 'package:retrieval_practice/utils/app_i18n.dart';

class HomeScreen extends StatefulWidget {
  final MainBloc mainBloc;

  HomeScreen(this.mainBloc);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.mainBloc.init();
  }

  Widget sliverAppBar(BuildContext context) {
    return SliverAppBar(
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsScreen(widget.mainBloc)));
          },
          child: StreamBuilder(
            stream: widget.mainBloc.appUserStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CircleAvatar(
                  radius: 16,
                  foregroundColor: appWhite,
                  child: Text(
                    snapshot.data.firstName[0].toUpperCase(),
                    style: TextStyle(fontSize: 16, color: appWhite),
                  ),
                  backgroundColor: appProfileAvatarGreen,
                );
              }

              return Container();
            },
          ),
        ),
        SizedBox(
          width: 18,
        )
      ],
      expandedHeight: 56.0,
      backgroundColor: appBlack,
      floating: true,
      // title: Text(
      //   'Spaced',
      //   style: appTitleTextStyle,
      // ),
      title: _LogoWithTitle(),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    var screenHeight = MediaQuery.of(context).size.height;

    var localizedStrings = SpacedAppLocalizations.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                settings: RouteSettings(name: '/createDeck'),
                builder: (context) => CreateDeckScreen(widget.mainBloc)),
          );
        },
      ),
      body: StreamBuilder<List<StudiedSubject>>(
          stream: widget.mainBloc.subjectListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.isEmpty) {
                return CustomScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  slivers: <Widget>[
                    //FIXME: this is duplicated
                    sliverAppBar(context),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Container(
                          height: screenHeight *
                              0.8, //FIXME: hardcoded.. 80% is meaningless just to make it work.
                          alignment: Alignment.center,
                          child: Container(
                            width: screenHeight * 0.25, //FIXME: weird
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(localizedStrings.homeNoDecksYet, style: deckTitleTextStyle),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  localizedStrings.homeNoDecksYetSubText,
                                  style: TextStyle(
                                      color: appLightGrey,
                                      fontSize: 15,
                                      height: 1.4),
                                )
                              ],
                            ),
                          ),
                        );
                      }, childCount: 1),
                    ),
                  ],
                );
              }

              var numOfDueQuestions = widget.mainBloc.allDueQuestions.length;
              var hasAnyDueQuestions = false;
              if (numOfDueQuestions > 0) hasAnyDueQuestions = true;

              return CustomScrollView(
                slivers: <Widget>[
                  sliverAppBar(context),
                  SliverList(
                    delegate: SliverChildListDelegate.fixed([
                      Visibility(
                        visible: hasAnyDueQuestions,
                        child: DueQuestionsCard(widget.mainBloc),
                      )
                    ]),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Deck(snapshot.data[index], widget.mainBloc);
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


class _LogoWithTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/launcher-icon-96.png'),
            radius: 16,
          ),
          SizedBox(width: 12),
          Text('Spaced', style: appTitleTextStyle,)
        ],
      ),
    );
  }
}
