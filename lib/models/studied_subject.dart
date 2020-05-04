import 'question.dart';

class StudiedSubject {
  int id;
  String title;

  String deckPhotoPath;

  List<Question> _questions = [];

  List<Question> get questions => List.unmodifiable(_questions);

  List<Question> get dueQuestions {
    var myList = [];
    for (var q in _questions) {
      if (q.isDue) myList.add(q);
    }
    return List.unmodifiable(myList);
  }

  StudiedSubject(this.title, this.deckPhotoPath);

  StudiedSubject.withQuestions(this.id, this.title, this.deckPhotoPath, this._questions);

  Map<String, dynamic> toMap() {
    // create list of question maps from list of question objects
    List<Map<String, dynamic>> questionsList = [];
    _questions.forEach((q) {
      questionsList.add(q.toMap());
    });

    return {
      'id': id,
      'title': title,
      'questions': questionsList,
      'deckPhotoPath': deckPhotoPath
    };
  }

  factory StudiedSubject.fromMap(Map<String, dynamic> map) {
    // create list of question objects from list of question maps
    var questionsList = List.generate(map['questions'].length, (i) {
      return Question.fromMap(map['questions'][i]);
    }, growable: true);

    return StudiedSubject.withQuestions(map['id'], map['title'], map['deckPhotoPath'], questionsList);
  }

  int get totalNumOfQuestions => _questions.length;

  int get numOfDueQuestions {
    int dueQuestionsCount = 0;
    for (var q in _questions) {
      if (q.isDue) dueQuestionsCount += 1;
    }
    return dueQuestionsCount;
  }

  void addNewQuestion(String frontSide, String backSide) {
    var newQuestion = Question.firstStudied(frontSide, backSide);
    _questions.add(newQuestion);
  }

  bool removeQuestion(Question aQuestion) {
    return _questions.remove(aQuestion);
  }
}
