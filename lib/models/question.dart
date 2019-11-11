import 'dart:math';
import 'study.dart';

class Question {
  int id;
  final String title;

  List<Study> _studies = [];

  double _lastEF;
  int _interval; // days until next study from the date the last study was done

  Question(this.title, this._studies, this._lastEF, this._interval);

  List<Study> get studies => List.unmodifiable(_studies);



  Map<String, dynamic> toMap() {
    // create list of study maps from list of study objects
    List<Map<String, dynamic>> studiesList = [];
    _studies.forEach((s) {
      studiesList.add(s.toMap());
    });

    return {
      'title': title,
      'studies': studiesList,
      'lastEF': _lastEF,
      'interval': _interval,
    };
  }



  factory Question.fromMap(Map<String, dynamic> map) {
    // create list of study objects from list of study maps
    var studiesList = List.generate(map['studies'].length, (i) {
      return Study.fromMap(map['studies'][i]);
    }, growable: true);

    return Question(map['title'], studiesList, map['lastEF'], map['interval']);
  }



  Question.firstStudied(this.title) {
    var now = DateTime.now();
    var year = now.year;
    var month = now.month;
    var day = now.day;
    _studies.add(Study(5, DateTime(year, month, day)));
    _computeDaysUntilNextStudyFromLastStudyDone();
  }

  DateTime get nextStudyDate =>
      _studies.last.date.add(Duration(days: _interval));

  int get daysUntilNextStudyFromToday {
    Duration diff = nextStudyDate.difference(DateTime.now());
    if (diff.isNegative) return 0;
    return (diff.inMinutes / (24 * 60)).ceil();
  }

  void addStudy(Study study) {
    _studies.add(study);
    _computeDaysUntilNextStudyFromLastStudyDone();
  }

  bool get isDue => daysUntilNextStudyFromToday == 0;

  void _computeDaysUntilNextStudyFromLastStudyDone() {
    if (_studies.length == 1) {
      _interval = 1;
      _lastEF = 2.5;
      return;
    }
    if (_studies.length == 2) {
      _interval = 6;
      _lastEF = 2.5;
      return;
    }

    int q = _studies.last.quality;

    double newEF = _lastEF - 0.8 + (0.28 * q) - (0.02 * q * q);
    newEF = max(newEF, 1.3);
    newEF = min(newEF, 2.5);

    _lastEF = newEF;

    _interval = (_interval * newEF).round();
  }
}
