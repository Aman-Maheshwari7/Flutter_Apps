import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new HomeState();
  }


}

class HomeState extends State<Home>{
  final TextEditingController _age=new TextEditingController();
  final TextEditingController _feet=new TextEditingController();
  final TextEditingController _weight=new TextEditingController();
  double bmi=0.0;

  String _result="";

  void calculation(){
    setState(() {


    bmi=double.parse(_weight.text)/double.parse(_feet.text);
    if(int.parse(_age.text)>21 && bmi>25){
      _result="Overweight";
    }
    else if(int.parse(_age.text)>21 && bmi>=21){
      _result="Fit";
    }
    else if(int.parse(_age.text)>21 && bmi<21){
      _result="Underweight";
    }
    else if(int.parse(_age.text)<=21 && bmi>=26){
      _result="Overweight";
    }
    else if(int.parse(_age.text)>21 && bmi>19){
      _result="Fit";
    }
    else if(int.parse(_age.text)>21 && bmi<=19){
      _result="Underweight";
    }
    });

    }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title:new Text(
        "BMI",
          style: new TextStyle(color: Colors.white,),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),

      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2),
          children: <Widget>[
            new Image.asset(
              'images/bmilogo.png',
              height: 140,
              width: 200,
            ),

            new Container(
              color: Colors.grey.shade300,
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _age,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText:"Age",
                      icon: new Icon(Icons.person),
                    ),

                  ),

                  new TextField(
                    controller: _feet,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText:"Height in feet",
                      icon: new Icon(Icons.bar_chart),
                    ),

                  ),
                  new TextField(
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText:"Weight in kgs",
                      icon: new Icon(Icons.horizontal_split_sharp),
                    ),

                  ),

                  new Padding(padding: new EdgeInsets.all(10.0)),

                    new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      new Container(
                        color: Colors.pinkAccent[200],
                        //margin: const EdgeInsets.only(left: 0.0),
                        child: new FlatButton(onPressed: calculation,
                            color: Colors.pinkAccent[200],


                        child: new Text("Calculate",
                          style: new TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            backgroundColor: Colors.pinkAccent[200],

                          ),
                        ),),

                      ),

                      ],

                    ),

                  new Padding(padding: new EdgeInsets.all(10.0)),

                    new Text(
                      _age.text.isEmpty|| _feet.text.isEmpty || _weight.text.isEmpty ? "Please enter all details" : "You are $_result",
                      style: new TextStyle(
                         color: Colors.pink,
                         fontSize: 19.4,
                         fontWeight: FontWeight.w500),
                  )








                    ]
                  )
            )
        ]

              )
            )

        );




  }
}