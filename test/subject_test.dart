// import 'package:flutter_test/flutter_test.dart';
// import 'package:retrieval_practice/models/subject.dart';
// import 'package:retrieval_practice/models/study.dart';

// void main() {
  
//   //TODO: this test uses now() ...  this is dangerous !
//   test('create new subject studied now, next study is 1 day later', () {
//     var subject = Question.firstStudied('What is an operating system?');
//     var now = DateTime.now();
//     var year = now.year;
//     var month = now.month;
//     var day = now.day;
//     expect(subject.nextStudyDate,
//         DateTime(year, month, day).add(Duration(days: 1)));
//   });

//   test('daysUntilNextStudy() works properly when I add each new study manually',
//       () {
//     var subject =
//         Question('What is an OS?', [Study(123, DateTime(2019, 9, 1))], 2.5, 1);

//     subject.addStudy(Study(123, DateTime(2019, 9, 2)));
//     expect(subject.nextStudyDate, DateTime(2019, 9, 8)); // 6 days

//     subject.addStudy(Study(5, DateTime(2019, 9, 8)));
//     expect(subject.nextStudyDate, DateTime(2019, 9, 23)); // 15 days

//     subject.addStudy(Study(5, DateTime(2019, 9, 23)));
//     expect(subject.nextStudyDate, DateTime(2019, 10, 31)); // 38 days

//     subject.addStudy(Study(5, DateTime(2019, 10, 31)));
//     expect(subject.nextStudyDate, DateTime(2020, 2, 3)); // 95 days

//     var subjectTwo =
//         Question('What is an OS?', [Study(123, DateTime(2019, 9, 1))], 2.5, 1);

//     subjectTwo.addStudy(Study(123, DateTime(2019, 9, 2)));
//     expect(subjectTwo.nextStudyDate, DateTime(2019, 9, 8)); // 6 days

//     subjectTwo.addStudy(Study(5, DateTime(2019, 9, 8)));
//     expect(subjectTwo.nextStudyDate, DateTime(2019, 9, 23)); // 15 days

//     subjectTwo.addStudy(Study(3, DateTime(2019, 9, 23)));
//     expect(subjectTwo.nextStudyDate, DateTime(2019, 10, 28)); // 35 days

//     subjectTwo.addStudy(Study(3, DateTime(2019, 10, 28)));
//     expect(subjectTwo.nextStudyDate, DateTime(2020, 1, 14)); // 78 days
//   });



//   test('', () {});

//   test('', () {});

//   test('', () {});

 
// }
