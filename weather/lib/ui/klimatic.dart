import 'dart:async';
import 'package:flutter/material.dart';
import '../util/utils.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';


class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
  void showStuff() async{
    Map data=await getWeather(util.appId,util.defaultCity);
    print(data.toString());
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Klimatic'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
          actions:<Widget>[
            new IconButton(
                icon: new Icon(Icons.menu),
              onPressed: showStuff),
          ],
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset('images/umbrella.png',
            width: 490.0,
            height: 1200.0,
            fit: BoxFit.fill,),


          ),
          new Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0,11.0,21.2,0.0),
            child: new Text('Spokane',
            style: cityStyle(),
          ),
          ),

          new Container(
            alignment: Alignment.center,
            child: new Image.asset('images/light_rain.png'),
    ),
            new Container(
              margin: const EdgeInsets.fromLTRB(30.0,380.0,0,0.0),
              //alignment: Alignment.center,
              child: updateTempWidget("Mumbai"),
    )



        ],
      )
    );
  }

  Future<Map> getWeather(String appId,String city) async{
    String apiUrl='http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=${util.appId}';
    http.Response response= await http.get(apiUrl);
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city){
    return new FutureBuilder(
      future: getWeather(util.appId, city),

        builder:(BuildContext context,
        AsyncSnapshot<Map> snapshot){
        if(snapshot.hasData){
          Map content=snapshot.data;
          return new Container(
            child: new Column(
              children: <Widget>[
                new ListTile(
                  title: new Text(content['main']['temp'].toString(),
                  style: new TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 46,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ))
                )
              ]
            )
          );
        }else{
          return new Container();
        }


    });
  }


 }

TextStyle cityStyle(){
  return new TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}

TextStyle tempStyle(){
  return new TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight:FontWeight.w500,
    fontSize: 49.9
  );
}