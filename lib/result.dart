import 'package:flutter/material.dart';
import 'dart:math';

class BMIData {
  int height;
  int weight;
  BMIData(this.height, this.weight);
}

class Result extends StatefulWidget {
  final BMIData bmiData;
  Result({Key key, @required this.bmiData}) : super(key: key);

  @override
  ResultState createState() => ResultState();
} 

class ResultState extends State<Result> {
  Color color;
  double bmi;
  String bmiText;

  @override
  void initState() {
    super.initState();
    BMIData bmiData = widget.bmiData;
    bmi = bmiData.weight / pow(bmiData.height / 100, 2);
    if(bmi < 17) {
      color = Colors.red;
      bmiText = 'Wychudzenie';
    } else if(bmi < 18.5) {
      color = Colors.orange;
      bmiText = 'Niedowaga';
    } else if(bmi < 25) {
      color = Colors.green;
      bmiText = 'Prawidłowa';
    } else if(bmi < 30) {
      color = Colors.orange;
      bmiText = 'Nadwaga';
    } else {
      color = Colors.red;
      bmiText = 'Otyłość';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twój wskaźnik BMI"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10), 
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(500)
                    ),
                    child: SizedBox(
                      width: 150, height: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(bmi.toStringAsFixed(1), style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
                          Text(bmiText, style: TextStyle(color: Colors.white, fontSize: 20))
                        ]
                      )
                    )
                    
                  )
              ]),
            )
          ],
        )
      )
    );
  }
}