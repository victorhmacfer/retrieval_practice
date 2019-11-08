class Study {
  final int _quality;
  final DateTime _date;

  DateTime get date => _date;

  int get quality => _quality;

  Study(this._quality, this._date);

  Map<String, dynamic> toMap(int questionId) {
    return {
      'quality': _quality,
      'date': _date,
      'q_id': questionId,
    };
  }
}
