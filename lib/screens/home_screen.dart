import 'package:flutter/material.dart';
import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/custom_widgets/deck.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/screens/create_deck_screen.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

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
              return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    expandedHeight: 56.0,
                    backgroundColor: Colors.black,
                    floating: true,
                    //TODO: make this not hardcoded
                    title: Text('Retrieval Practice'),
                    centerTitle: true,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(

                      (context, index) {
                        return Deck(snapshot.data[index].title);
                      },
                      childCount: snapshot.data.length
                      
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: Text('Nao tem nenhum deck ainda!'),
            );
          }),
    );
  }
}
