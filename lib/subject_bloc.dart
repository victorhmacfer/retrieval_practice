import 'dart:async';

import 'package:retrieval_practice/bloc_base.dart';
import 'package:retrieval_practice/subject.dart';


// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// const RET_PRAC_DB_NAME = 'ret_prac_database.db';

class SubjectBloc extends BlocBase {
  List<Subject> _subjects = [];

  final StreamController<List<Subject>> _subjectStreamController =
      StreamController.broadcast();

  Stream<List<Subject>> get subjectStream => _subjectStreamController.stream;

  // Database _database;

  SubjectBloc() {}

  // void _initializeDatabaseReference() async {
  //   var path = await getDatabasesPath();
  //   _database = await openDatabase(join(path, RET_PRAC_DB_NAME));
  // }

  //TODO: should receive title as argument
  void onNewSubjectPressed(String title) {
    _subjects.add(Subject.firstStudied(title));
    _subjectStreamController.add(_subjects);
  }



  @override
  void dispose() {
    _subjectStreamController.close();
    
  }
}
