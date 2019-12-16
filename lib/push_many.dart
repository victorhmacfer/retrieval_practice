import 'package:flutter/material.dart';

Future pushMany(BuildContext context, List<Widget> pageList) {
  for (var i = 0; i < pageList.length; i++) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => pageList[i]));
  }
  return null;
}
