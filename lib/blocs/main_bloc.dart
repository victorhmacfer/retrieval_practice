import 'dart:async';

import 'package:path/path.dart';
import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:sqflite/sqflite.dart';

class MainBloc extends BlocBase {
  List<Subject> _subjects = [];

  final StreamController<List<Subject>> _subjectStreamController =
      StreamController.broadcast();

  Stream<List<Subject>> get subjectStream => _subjectStreamController.stream;

  Future<Database> _database;

  Future<void> init() async {
    _database = openDatabase(
      join(await getDatabasesPath(), 'retrieval_practice.db'),
      onCreate: (db, version) {
        db.execute("""
            CREATE TABLE subject(
              subject_id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT)""");

        db.execute("""
            CREATE TABLE question(
              question_id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              lastEF REAL,
              interval INTEGER,
              sub_id INTEGER,
              FOREIGN KEY(sub_id) REFERENCES subject(subject_id))""");

        db.execute("""CREATE TABLE study(
              study_id INTEGER PRIMARY KEY AUTOINCREMENT,
              quality INTEGER,
              date TEXT,
              q_id INTEGER,
              FOREIGN KEY(q_id) REFERENCES question(question_id))""");
      },
      version: 1,
    );

    _subjects = await _readSubjectsFromDb();
    _subjectStreamController.add(_subjects);

  }

  //TODO: this is wrong.. only gets titles from subjects
  Future<List<Subject>> _readSubjectsFromDb() async {
    var myDb = await _database;

    final List<Map<String, dynamic>> subjectMaps =
        await myDb.query('subject');

    return List.generate(subjectMaps.length, (i) {
      return Subject(
        subjectMaps[i]['title']
      );
    }, growable: true);
  }

  MainBloc();

  Future<void> _insertNewSubjectIntoDb(Subject subject) async {
    final Database db = await _database;

    var mySubjectId = await db.insert('subject', subject.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    // var myQuestions = subject.questions;

    // myQuestions.forEach((q) async {
    //   var myQuestionId = await db.insert('question', q.toMap(mySubjectId),
    //       conflictAlgorithm: ConflictAlgorithm.replace);
    //   var questionStudies = q.studies;
    //   questionStudies.forEach((s) async {
    //     db.insert('study', s.toMap(myQuestionId));
    //   });
    // });
  }

  Future<void> onCreateNewSubject(String title) async {
    var newSubject = Subject(title);
    _subjects.add(newSubject);
    _subjectStreamController.add(_subjects);

    _insertNewSubjectIntoDb(newSubject);
  }

  void onCreateNewQuestion(String questionTitle, Subject subject) {
    subject.addNewQuestion(questionTitle);
  }

  @override
  void dispose() {
    _subjectStreamController.close();
  }
}
