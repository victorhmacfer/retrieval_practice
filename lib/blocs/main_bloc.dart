import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:retrieval_practice/blocs/bloc_base.dart';
import 'package:retrieval_practice/models/deck_cover_photo.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/models/subject.dart';
import 'package:retrieval_practice/models/study.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;




const DB_NAME = 'retrieval_practice.db';

enum SignUpResponseStatus { SUCCESS, EMAIL_ALREADY_IN_USE }

enum LoginResponseStatus { SUCCESS, USER_NOT_FOUND, WRONG_PASSWORD }



class MainBloc extends BlocBase {
  List<Subject> _subjects = [];

  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _loggedInUser;

  final StreamController<List<Subject>> _subjectListStreamController =
      StreamController.broadcast();

  Stream<List<Subject>> get subjectListStream =>
      _subjectListStreamController.stream;

  final StreamController<List<DeckCoverPhoto>>
      _deckCoverPhotoListStreamController = StreamController.broadcast();


  // IN CASE OF ERROR WHILE FETCHING PHOTOS, AN EMPTY LIST IS PUT ON THE STREAM !
  Stream<List<DeckCoverPhoto>> get deckCoverPhotoListStream =>
      _deckCoverPhotoListStreamController.stream;

  final StreamController<File> _photoFileStreamController =
      StreamController.broadcast();

  Stream<File> get photoFileStream => _photoFileStreamController.stream;

  Database db;

  StoreRef<int, Map<String, dynamic>> mySubjectStore;

  MainBloc();

  // This returns a List of lists...
  // A List of [aDueQuestion, itsSubject]
  List<dynamic> get allDueQuestions {
    var myList = [];
    for (var s in _subjects) {
      var dueQuestionsForSubject = s.dueQuestions;
      for (var q in dueQuestionsForSubject) {
        myList.add([q, s]);
      }
    }
    return myList;
  }

  Future<void> init() async {
    await _initDb();
    mySubjectStore = intMapStoreFactory.store('subjects');
    await _populateSubjectListFromDb();
    _subjectListStreamController.add(_subjects);
  }

  Future<void> onCreateNewSubject(String title) async {
    var newSubject = Subject(title);
    _subjects.add(newSubject);
    _subjectListStreamController.add(_subjects);

    //put new subject into database
    int key = await mySubjectStore.add(db, newSubject.toMap());
    newSubject.id = key;
  }

  Future<void> onCreateNewQuestion(String questionFrontSide,
      String questionBackSide, Subject subject) async {
    subject.addNewQuestion(questionFrontSide, questionBackSide);

    await _updateSubjectInDatabase(subject);
  }

  Future<void> onAddStudy(Question q, Subject s, int answerQuality) async {
    q.addStudy(Study(answerQuality, DateTime.now()));
    await _updateSubjectInDatabase(s);
  }

  //TODO: maybe this should return bool to inform about success
  Future<void> onDeleteDeck(Subject subjectToBeDeleted) async {
    _subjects.remove(subjectToBeDeleted);
    _subjectListStreamController.add(_subjects);

    final finder = Finder(filter: Filter.byKey(subjectToBeDeleted.id));
    await mySubjectStore.delete(
      db,
      finder: finder,
    );
  }

  //TODO: maybe this should return bool to inform about success
  Future<void> onDeleteQuestion(theQuestion, Subject itsSubject) async {
    itsSubject.removeQuestion(theQuestion);
    _subjectListStreamController.add(_subjects);
    _updateSubjectInDatabase(itsSubject);
  }

  Future<int> _updateSubjectInDatabase(Subject theSubject) async {
    final finder = Finder(filter: Filter.byKey(theSubject.id));
    return await mySubjectStore.update(
      db,
      theSubject.toMap(),
      finder: finder,
    );
  }

  Future _initDb() async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var user = await loggedInUser;
    var dbPath = join(dir.path, _makeDbName(user));
    db = await databaseFactoryIo.openDatabase(dbPath);
  }

  String _makeDbName(FirebaseUser loggedInUser) {
    if (loggedInUser == null) {
      return 'loggedOut.db';
    }
    return 'user-${loggedInUser.uid}.db';
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
      return mySub;
    }).toList();
  }

  Future<void> onCoverPhotoSearchSubmitted(String searchKeyword) async {
    List<DeckCoverPhoto> myPhotosList;
    try {
      myPhotosList = await _fetchListOfCoverPhotos(searchKeyword);
    } on SocketException catch (e) {
      _deckCoverPhotoListStreamController.add([]);
      return;
    }
    _deckCoverPhotoListStreamController.add(myPhotosList);
    
  }

  // TODO: fetches hardcoded number of photos...  30.
  Future<List<DeckCoverPhoto>> _fetchListOfCoverPhotos(
      String searchKeyword) async {

    //TODO: THE QUERY PARAMETERS DONT WORK !!! THIS RETURNS ALL RESULTS FOR THE KEYWORD , NOT ONLY 30
    final String searchUrl =
        'https://api.unsplash.com/search/photos/?client_id=238cc98d67d016f02e5aaf29a168c5aa8975d78bdf892198657abd3b49629b13' +
            '&query=$searchKeyword&per_page=30';

    final response = await http.get(searchUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> myJsonResponse = json.decode(response.body);

      final List myJsonResultsList = myJsonResponse['results'];

      List<DeckCoverPhoto> photosList = [];
      for (int i = 0; i < 30; i++) {
        photosList.add(DeckCoverPhoto.fromMap(myJsonResultsList[i]));
      }

      return photosList;
    } else {
      throw Exception('Failed to load photos.');
    }
  }



  Future<File> _downloadPhoto(DeckCoverPhoto photo, String filename) async {
    String myDownloadLink = photo.downloadLink +
        '?client_id=238cc98d67d016f02e5aaf29a168c5aa8975d78bdf892198657abd3b49629b13';

    final http.Response response = await http.get(myDownloadLink);

    var bytes = response.bodyBytes;

    //TODO: THIS IS DUPLICATED CODE !!! HANDLE LATER
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }


  // TODO this is never called... Just making the app work again for now..
  Future<void> onCoverPhotoChosen(DeckCoverPhoto photo) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File('$dir/photo-id-${photo.id}');

    bool fileExists = await file.exists();

    if (fileExists) {
      _photoFileStreamController.add(file);
    } else {
      var photoFile = await _downloadPhoto(photo, 'photo-id-${photo.id}');
      _photoFileStreamController.add(photoFile);
    }
  }


  



  

  Future<FirebaseUser> get loggedInUser async {
    if (_loggedInUser != null) return _loggedInUser;
    return _auth.currentUser();
  }

  Future<SignUpResponseStatus> signUpWithEmailAndPassword(
      email, password) async {
    FirebaseUser user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return SignUpResponseStatus.EMAIL_ALREADY_IN_USE;
      }
    }
    _loggedInUser = user;
    return SignUpResponseStatus.SUCCESS;
  }

  Future<bool> isSignedIn() async {
    var theUser = await _auth.currentUser();
    return theUser != null;
  }

  logout() async {
    print('got inside logout');
    _loggedInUser = null;
    await _auth.signOut();
    print('signout has finished');
  }

  Future<LoginResponseStatus> loginWithEmailAndPassword(email, pwd) async {
    FirebaseUser user;
    try {
      user =
          (await _auth.signInWithEmailAndPassword(email: email, password: pwd))
              .user;
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_USER_NOT_FOUND') {
        return LoginResponseStatus.USER_NOT_FOUND;
      } else if (e.code == 'ERROR_WRONG_PASSWORD') {
        return LoginResponseStatus.WRONG_PASSWORD;
      }
    }

    _loggedInUser = user;
    return LoginResponseStatus.SUCCESS;
  }


  

  @override
  void dispose() {
    _subjectListStreamController.close();
    db.close();
  }
}
