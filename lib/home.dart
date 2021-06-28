import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var txt) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + txt;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.amber,
          textStyle: TextStyle(
            fontSize: 20
          )
          
        ),
        child: Text(txt));
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            color: Colors.blue,
            child: Text("Calculator", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color:Colors.white ),),
          ),
          Container(
            width: 250,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                
                result,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          
            children: [
              btn("1"),
              btn("2"),
              btn("3"),
              btn("4"),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("5"),
              btn("6"),
              btn("7"),
              btn("8"),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("9"),
              btn("0"),
              btn("+"),
              btn("-"),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              btn("*"),
              btn("/"),
              ElevatedButton(onPressed: clear, child: Text("Clear")),
              ElevatedButton(onPressed: output, child: Text("="))
            ],
          ),
        ],
      ),
    );
  }
}
