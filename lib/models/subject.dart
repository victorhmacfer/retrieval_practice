import 'question.dart';

class Subject {

  String title;

  List<Question> _questions = [];

  List<Question> get questions => List.unmodifiable(_questions);

  Subject(this.title);

  int get totalNumOfQuestions => _questions.length;

  int get numOfDueQuestions {
    int dueQuestionsCount = 0;
    for (var q in _questions) {
      if (q.isDue) dueQuestionsCount += 1; 
    }
    return dueQuestionsCount;
  }

  void addNewQuestion(String title) {
    var newQuestion = Question.firstStudied(title);
    _questions.add(newQuestion);
  }

}
