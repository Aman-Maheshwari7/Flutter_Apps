import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*overriding in built*/
    return new Material(
        color: Colors.deepOrange,
        child: new Center(
          child: new Text("Hello, there!",
              textDirection: TextDirection.ltr,
              /*left to right*/
              style: new TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.5)),
        ));
  }
}