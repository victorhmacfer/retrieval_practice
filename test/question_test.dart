import 'package:flutter_test/flutter_test.dart';
import 'package:retrieval_practice/models/question.dart';
import 'package:retrieval_practice/models/study.dart';

void main() {
  
  //TODO: this test uses now() ...  this is dangerous !
  test('create new question studied now, next study is 1 day later', () {
    var question = Question.firstStudied('What is an operating system?');
    var now = DateTime.now();
    var year = now.year;
    var month = now.month;
    var day = now.day;
    expect(question.nextStudyDate,
        DateTime(year, month, day).add(Duration(days: 1)));
  });

  test('daysUntilNextStudyFromToday() works properly when I add each new study manually',
      () {
    var question =
        Question('What is an OS?', [Study(123, DateTime(2019, 9, 1))], 2.5, 1);

    question.addStudy(Study(123, DateTime(2019, 9, 2)));
    expect(question.nextStudyDate, DateTime(2019, 9, 8)); // 6 days

    question.addStudy(Study(5, DateTime(2019, 9, 8)));
    expect(question.nextStudyDate, DateTime(2019, 9, 23)); // 15 days

    question.addStudy(Study(5, DateTime(2019, 9, 23)));
    expect(question.nextStudyDate, DateTime(2019, 10, 31)); // 38 days

    question.addStudy(Study(5, DateTime(2019, 10, 31)));
    expect(question.nextStudyDate, DateTime(2020, 2, 3)); // 95 days

    var questionTwo =
        Question('What is an OS?', [Study(123, DateTime(2019, 9, 1))], 2.5, 1);

    questionTwo.addStudy(Study(123, DateTime(2019, 9, 2)));
    expect(questionTwo.nextStudyDate, DateTime(2019, 9, 8)); // 6 days

    questionTwo.addStudy(Study(5, DateTime(2019, 9, 8)));
    expect(questionTwo.nextStudyDate, DateTime(2019, 9, 23)); // 15 days

    questionTwo.addStudy(Study(3, DateTime(2019, 9, 23)));
    expect(questionTwo.nextStudyDate, DateTime(2019, 10, 28)); // 35 days

    questionTwo.addStudy(Study(3, DateTime(2019, 10, 28)));
    expect(questionTwo.nextStudyDate, DateTime(2020, 1, 14)); // 78 days
  });

}
