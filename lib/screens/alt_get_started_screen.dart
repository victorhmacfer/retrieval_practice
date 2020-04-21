import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrieval_practice/blocs/main_bloc.dart';

import 'package:retrieval_practice/custom_widgets/pill_button.dart';
import 'package:retrieval_practice/styles/my_styles.dart';

import 'home_screen.dart';



// //TODO: fix appearance  and use styles
// class AltGetStartedScreen extends StatelessWidget {

//   MainBloc mainBloc;

//   AltGetStartedScreen(this.mainBloc);


//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(statusBarColor: Colors.transparent));


//     return Material(
//       child: Container(
//         alignment: Alignment(0, 1.0),
//         constraints: BoxConstraints.expand(),
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(
//                     'assets/images/space-get-started.jpg'
//                 ),
//                 fit: BoxFit.fill
//                     )),
//         child: Container(
//           // color: Colors.green,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Text('SPACED', style: TextStyle(fontSize: 56, letterSpacing: 12),),
//               SizedBox(height: 272),
//               Container(
//                 // color: Colors.red,
//                 height: 280,
//                 padding: const EdgeInsets.symmetric(vertical: 108, horizontal: 44),
//                 child: AccentPillButton(
//                   'GET STARTED',
//                   () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         settings: RouteSettings(name: '/home'),
//                         builder: (context) => HomeScreen(mainBloc)),
//                     );
//                   }

//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }