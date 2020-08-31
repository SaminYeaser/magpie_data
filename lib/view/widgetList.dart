import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AppBarText() {
  return TweenAnimationBuilder(
    child: Text(
      'Magpie Data',
      style: TextStyle(
          fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    duration: Duration(milliseconds: 500),
    tween: Tween<double>(begin: 0, end: 1),
    builder: (BuildContext context, _val, Widget child) {
      return Opacity(
        opacity: _val,
        child: Padding(
          padding: EdgeInsets.only(top: _val *20),
          child: child,
        ),
      );
    },
  );
}
