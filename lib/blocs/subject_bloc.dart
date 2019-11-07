import 'dart:async';

import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/models/subject.dart';


// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// const RET_PRAC_DB_NAME = 'ret_prac_database.db';

// class SubjectBloc extends BlocBase {
//   List<Question> _subjects = [];

//   final StreamController<List<Question>> _subjectStreamController =
//       StreamController.broadcast();

//   Stream<List<Question>> get subjectStream => _subjectStreamController.stream;

//   // Database _database;

//   SubjectBloc() {}

//   // void _initializeDatabaseReference() async {
//   //   var path = await getDatabasesPath();
//   //   _database = await openDatabase(join(path, RET_PRAC_DB_NAME));
//   // }

//   //TODO: should receive title as argument
//   void onNewSubjectPressed(String title) {
//     _subjects.add(Question.firstStudied(title));
//     _subjectStreamController.add(_subjects);
//   }



//   @override
//   void dispose() {
//     _subjectStreamController.close();
    
//   }
// }
