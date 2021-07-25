import 'dart:async';


import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';

void main() async {
  var data = await readData();
  if(data!=null){
    String message= await readData();
    print(message);
  }


  runApp(new MaterialApp(
    title:'IO',
    home: new Home(),
  )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _enterDataField=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Read/Write"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),

      body: new Container(
          padding: const EdgeInsets.all(13.5),
          alignment: Alignment.topCenter,
          child: new ListTile(
              title: new TextField(
                controller: _enterDataField,
                decoration: new InputDecoration(
                    labelText: 'Write Something'),
              ),

              subtitle: new FlatButton(
                color: Colors.redAccent,
                  onPressed: () {
                    writeData(_enterDataField.text);
                  },
                  child: new Column(
                      children: <Widget>[
                        new Text('Save Data'),
                        new Padding(padding: new EdgeInsets.all(14.5)),
                        new Text('Saved data goes here'),
                      ],
                  )
              ),

          ),
      ),
    );
  }
  }



  Future<String> get _localPath async {
    final directory= await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async{
    final path=await _localPath;
    return new File('$path/data.txt');//data.txt is file name. It can be anything we want

  }

  //Write and read from the file

  Future<File> writeData(String message) async{
    final file= await _localFile;
    return file.writeAsString('$message');
  }

  Future<String> readData() async{
    try{
      final file= await _localFile;

      //Read
      String data=await file.readAsString();

      return data;

    }catch(e){

      return "Nothing saved yet!";

    }
  }




