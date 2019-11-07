import 'dart:async';

import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/models/subject.dart';



class MainBloc extends BlocBase {

  List<Subject> _subjects = [];

  final StreamController<List<Subject>> _subjectStreamController =
      StreamController.broadcast();

  Stream<List<Subject>> get subjectStream => _subjectStreamController.stream;


  MainBloc();


  // void onNewSubjectPressed(String title) {
  //   _subjects.add(Subject.firstStudied(title));
  //   _subjectStreamController.add(_subjects);
  // }

  void onCreateNewSubject(String title) {
    var newSubject = Subject(title);
    _subjects.add(newSubject);
    _subjectStreamController.add(_subjects);
  }

  void onCreateNewQuestion(String questionTitle, Subject subject) {
    subject.addNewQuestion(questionTitle);
  }



  @override
  void dispose() {
    _subjectStreamController.close();
    
  }
}