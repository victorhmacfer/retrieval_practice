import 'package:flutter/material.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/styles/my_styles.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

class DeletionModal extends StatelessWidget {
  final Subject subject;

  final MainBloc bloc;

  DeletionModal({@required this.subject, @required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              subject.title,
              style: deckTitleTextStyle,
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {
                bloc.onDeleteDeck(subject);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.delete, color: appWhite),
                  ),
                  Text(
                    'delete',
                    style: deckTitleTextStyle.copyWith(fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
