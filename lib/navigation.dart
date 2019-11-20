import 'package:flutter/material.dart';

class NoAnimationPageRoute extends MaterialPageRoute {
  NoAnimationPageRoute({WidgetBuilder builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

Future pushWithoutAnimation(BuildContext context, Widget page) {
  Route route = NoAnimationPageRoute(builder: (BuildContext context) => page);
  return Navigator.push(context, route);
}

Future pushMany(BuildContext context, List<Widget> pageList) {
  for (var i = 0; i < pageList.length; i++) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => pageList[i]));
  }
  return null;
}
