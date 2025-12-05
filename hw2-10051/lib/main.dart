import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String display = "0";

  Widget buildButton(
    String text, {
    Color? color = const Color(0xFF333333),
    double flex = 1,
  }) {
    return Expanded(
      flex: flex.toInt(),
      child: Padding(

        padding: const EdgeInsets.all(8.0), 
        child: ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(text == "0" ? 50 : 100),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 22,
              horizontal: text == "0" ? 60 : 0,
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator-10051",selectionColor: Colors.black),
        backgroundColor: Colors.orange,
        ),
        
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Text(
                  display,
                  style: const TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            
            Row(
              children: <Widget>[
                buildButton("AC", color: const Color(0xFFA5A5A5)),
                buildButton("+/-", color: const Color(0xFFA5A5A5)),
                buildButton("%", color: const Color(0xFFA5A5A5)),
                buildButton("/", color: Colors.orange),
              ],
            ),
            
            Row(
              children: <Widget>[
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("x", color: Colors.orange),
              ],
            ),

            Row(
              children: <Widget>[
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("-", color: Colors.orange),
              ],
            ),

            Row(
              children: <Widget>[
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("+", color: Colors.orange),
              ],
            ),
            
            Row(
              children: <Widget>[
                buildButton("0", flex: 2),
                buildButton("."),
                buildButton("=", color: Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }
}