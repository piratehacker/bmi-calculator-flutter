import 'package:flutter/material.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          title: TextStyle(fontSize: 25, color: Colors.grey[800])
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BMIData data = new BMIData(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oblicz swoje BMI'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Padding(padding: EdgeInsets.all(5), 
                  child:Text('Wpisz dane', textAlign: TextAlign.left, style: Theme.of(context).textTheme.title),
                )
              ]),
              Padding(padding: EdgeInsets.all(5.0), 
                child: TextField(
                  decoration: InputDecoration(labelText: 'Waga [kg]'),
                  keyboardType: TextInputType.number,
                  onChanged: (String text){
                    setState(() {
                      data.weight = int.parse(text);
                    });
                  },
              )),
              
              Padding(padding: EdgeInsets.all(5.0), 
                child: TextField(
                decoration: InputDecoration(labelText: 'Wzrost [cm]'),
                keyboardType: TextInputType.number,
                onChanged: (String text){
                  setState(() {
                    data.height = int.parse(text);
                  });
                },
              )),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  child: Text("OK", style: TextStyle(color:Colors.white)),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(bmiData:data)),
                    );
                  },
                )
              ],)
            ],
          )
      )
    );
  }
}
