import 'dart:async';

import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

const DB_NAME = 'retrieval_practice.db';

class MainBloc extends BlocBase {
  List<Subject> _subjects = [];

  final StreamController<List<Subject>> _subjectStreamController =
      StreamController.broadcast();

  Stream<List<Subject>> get subjectStream => _subjectStreamController.stream;

  Database db;

  StoreRef<int, Map<String, dynamic>> mySubjectStore;

  MainBloc();

  Future<void> init() async {
    await _initDb();
    mySubjectStore = intMapStoreFactory.store('subjects');
    await _populateSubjectListFromDb();
    //print('Estou no init, acabei de executar de popular a subject list.');
    _subjectStreamController.add(_subjects);
    //print('Estou no init, acabei de colocar a subject list no stream.');
  }

  Future<void> onCreateNewSubject(String title) async {
    var newSubject = Subject(title);
    //print('Estou no onCreateSubject acabei de criar o subject de title: $title');
    _subjects.add(newSubject);
    _subjectStreamController.add(_subjects);
    //print('Estoi no onCreateSubject acabei de colocar a subject list no stream.');

    //put new subject into database
    int key = await mySubjectStore.add(db, newSubject.toMap());
    newSubject.id = key;
    //print('acabei de pegar essa key: $key do metodo add da store para o subject ${newSubject.title}');
  }

  Future<void> onCreateNewQuestion(
      String questionTitle, Subject subject) async {
    subject.addNewQuestion(questionTitle);

    // put subject updated with new question into database
    final finder = Finder(filter: Filter.byKey(subject.id));
    await mySubjectStore.update(
      db,
      subject.toMap(),
      finder: finder,
    );
  }

  Future<void> onDeleteDeck(Subject subjectToBeDeleted) async {
    _subjects.remove(subjectToBeDeleted);

    final finder = Finder(filter: Filter.byKey(subjectToBeDeleted.id));
    await mySubjectStore.delete(
      db,
      finder: finder,
    );

    _subjectStreamController.add(_subjects);
  }

  Future _initDb() async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, DB_NAME);
    db = await databaseFactoryIo.openDatabase(dbPath);
  }

  Future<void> _populateSubjectListFromDb() async {
    final finder = Finder(sortOrders: [
      SortOrder('title'),
    ]);

    final List<RecordSnapshot> recordSnapshots = await mySubjectStore.find(
      db,
      finder: finder,
    );

    _subjects = recordSnapshots.map((snapshot) {
      Subject mySub = Subject.fromMap(snapshot.value);
      mySub.id = snapshot.key;
      //print('Estou no populate.. id de subject do db: ${mySub.id}, nome: ${mySub.title}');
      return mySub;
    }).toList();
  }

  @override
  void dispose() {
    _subjectStreamController.close();
    db.close();
  }
}
