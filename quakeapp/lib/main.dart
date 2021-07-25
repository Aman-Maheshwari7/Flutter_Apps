import 'dart:async';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


//import "package:intl/intl_browser.dart";

void main() async{
  Map _data= await getJson();




  runApp(new MaterialApp(
    home: new Scaffold(
     appBar: new AppBar(
       title:new Text("Quakes",style: new TextStyle(color: Colors.green)),
       centerTitle: true,
       backgroundColor: Colors.red,

     ),

      body: new Center(
        child: new ListView.builder(
          itemCount: _data['features'].length,
          padding: const EdgeInsets.all(14.5),
          itemBuilder: (BuildContext context, int pos){
            if(pos.isOdd) return new Divider();
            final position=pos~/2;
            var y=_data['features'][position]['properties']['time'];
            y=y*1000;
            var date = new DateTime.fromMillisecondsSinceEpoch(y);
            //var format = new DateFormat("yMd");
            //var dateString = format.format(date);
            return Column(
              children: <Widget>[
                new Divider(height: 5.5),
                new ListTile(
                title: Text(
                  "At: $date",
                  style: new TextStyle(fontSize: 17.9),
                  ),
                subtitle: Text("${_data['features'][position]['properties']['place']}",
                style: new TextStyle(
                fontSize: 13.9,
                color: Colors.grey,
                fontStyle: FontStyle.italic)),
                leading: new CircleAvatar(
                backgroundColor: Colors.greenAccent,
                  child: Text(
                    "${_data['features'][position]['properties']['mag']}",
                    style: new TextStyle(
                        fontSize: 16.4, color: Colors.orangeAccent),
                  ),
                //
            ),

                  onTap:() => _showonTapMessage(context, _data['features'][position]['properties']['place'].toString()),
            ),
              ]
            );
          },

        )
        ),
    )
  ));
}
void _showonTapMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: Text("My App"),
    content: Text(message),
    actions: <Widget>[
      FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.pop(context);
        },)
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}


Future<Map> getJson() async {
  String apiUrl ='https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson' ;

  http.Response response = await http.get(apiUrl);


  return json.decode(response.body); // returns a List type
}
