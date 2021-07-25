import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  void on_press(){
    print("Search tapped!");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text("Sunny day"),

        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.send), onPressed: () => debugPrint("Icon tapped")),
          new IconButton(icon: new Icon(Icons.search), onPressed: on_press),
        ]
      ),

      //other properties

      backgroundColor: Colors.grey.shade200,
      body: new Container(
          alignment:Alignment.center,
      child: new Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        new Text("Hi", style: new TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black87),),
        new Text("Hi", style: new TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black87),),
        new InkWell(
            child: new Text("Button", style: new TextStyle(fontSize: 15, color: Colors.blueAccent),),
            onTap: ()=> debugPrint("Button tapped"),
        ),
      ],

      ),

      ),

      floatingActionButton: new FloatingActionButton(onPressed: ()=> debugPrint("Pressed"),
      backgroundColor: Colors.amber,tooltip: 'Chatbot',
      child: new Icon(Icons.chat),),


      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.add), title: new Text("Attach") ),
        new BottomNavigationBarItem(icon: new Icon(Icons.picture_as_pdf), title: new Text("Picture") ),
        new BottomNavigationBarItem(icon: new Icon(Icons.call), title: new Text("call") ),
      ], onTap: (int i) => debugPrint("Hey touched $i"),),


    );

  }
}