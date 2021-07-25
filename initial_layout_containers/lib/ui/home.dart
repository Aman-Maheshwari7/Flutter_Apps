import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        color: Colors.greenAccent,
      alignment: Alignment.center,
      child: Stack(
    alignment: Alignment.bottomCenter,
        children: <Widget>[
          const Text("Hello there"),
          const Text("Hi"),
          const Text("1"),
        ]
    )
    );

    //   child: new Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //
    //          children: <Widget>[
    //           new Text("First item",textDirection: TextDirection.ltr,
    //           style: new TextStyle(color: Colors.white, fontSize: 12), ),
    //           new Text("Second item",textDirection: TextDirection.ltr,
    //             style: new TextStyle(color: Colors.blue,fontSize: 12),),
    //            const Expanded(       //takes up the rest of teh space available on the screen
    //              child: const Text("Item 3")
    //            )
    // ],
    //   ),
    //
    //   );
      // child: new Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //
      //     children: <Widget>[
      //       new Text("First item",textDirection: TextDirection.ltr,
      //       style: new TextStyle(color: Colors.white),),
      //       new Text("Second item",textDirection: TextDirection.ltr,
      //         style: new TextStyle(color: Colors.blue),),
      //       new Container(
      //         color: Colors.deepOrange.shade100,
      //         alignment: Alignment.bottomLeft,
      //         child: new Text("third item",textDirection: TextDirection.ltr,
      //           style: new TextStyle(color: Colors.white),),
      //       )
      //
      //
      //
      //     ],
      //   ),

    // );

  }
}