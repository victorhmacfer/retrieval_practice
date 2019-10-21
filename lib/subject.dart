/* 
algorithm:

if numOfStudiesDone == 1 ,  I(1) == 1,  next review is tomorrow
if numOfStudiesDone == 2,  I(2) == 6,  next review is 6 days from today


*/

import 'dart:math';

class Subject {

  String _title;

  List<Study> _studies = [];

  double _lastEF;
  int _interval;

  Subject(this._title, this._studies, this._lastEF, this._interval);

  Subject.firstStudied(this._title) {
    var now = DateTime.now();
    var year = now.year;
    var month = now.month;
    var day = now.day;
    _studies.add(Study(5, DateTime(year, month, day)));
    _computeDaysUntilNextStudy();
  }

  DateTime get nextStudyDate => _studies.last._date.add(Duration(days: _interval));

  void add(Study study) {
    _studies.add(study);
    _computeDaysUntilNextStudy();
  }


  void _computeDaysUntilNextStudy() {
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

class Study {
  final int _quality;
  final DateTime _date;

  int get quality => _quality;

  Study(this._quality, this._date);
}
