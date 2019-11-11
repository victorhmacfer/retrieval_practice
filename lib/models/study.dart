class Study {
  int id;
  final int _quality;
  final DateTime _date;

  DateTime get date => _date;

  int get quality => _quality;

  Study(this._quality, this._date);


  factory Study.fromMap(Map<String, dynamic> map) {
    return Study(map['quality'], DateTime.parse(map['date']));
  }


  Map<String, dynamic> toMap() {
    return {
      'quality': _quality,
      'date': _date.toString(),
    };
  }
}
