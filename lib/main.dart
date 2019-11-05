import 'package:flutter/material.dart';
import 'package:retrieval_practice/subject_bloc.dart';
import 'bloc_base.dart';
import 'subject.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubjectBloc>(
      bloc: SubjectBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final myController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var subjectBloc = BlocProvider.of<SubjectBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: Container(
        //color: Colors.green,
        padding: const EdgeInsets.all(32),
        height: 128,
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            TextField(
              controller: myController,
            ),
            SizedBox(height: 24,),

            Container(
              //color: Colors.red,
              height: 376,
              //constraints: BoxConstraints.expand(),
              child: _myListView(context)),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          subjectBloc.onNewSubjectPressed(myController.text);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _myListView(BuildContext myContext) {
    return StreamBuilder(
      stream: BlocProvider.of<SubjectBloc>(myContext).subjectStream,
      builder: (context, snapshot) {
        print('I got in here..');
        if (!snapshot.hasData) return Text('I have no subjects yet!');

        List<Subject> subjects = snapshot.data;

        return ListView(
          children: subjects.map(_buildItem).toList(),
        );
      },
    );
  }

  Widget _buildItem(Subject subject) {

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text(subject.title),
          Text(subject.nextStudyDate.toIso8601String()),

        ],
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }


}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
