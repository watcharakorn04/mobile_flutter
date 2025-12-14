import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "My App", home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num = 0;
  String num1 = "";
  String num2 = "";
  String operator = "";
  String showVal = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator"), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(showVal.toString(), style: TextStyle(fontSize: 40, color: Colors.red)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "7";
                        showVal = num1;
                      } else {
                        num2 += "7";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("7"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "8";
                        showVal = num1;
                      } else {
                        num2 += "8";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("8"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "9";
                        showVal = num1;
                      } else {
                        num2 += "9";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("9"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "+";
                    });
                  },
                  child: Text("+"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "4";
                        showVal = num1;
                      } else {
                        num2 += "4";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("4"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "5";
                        showVal = num1;
                      } else {
                        num2 += "5";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("5"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "6";
                        showVal = num1;
                      } else {
                        num2 += "6";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("6"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "-";
                    });
                  },
                  child: Text("-"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "1";
                        showVal = num1;
                      } else {
                        num2 += "1";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("1"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "2";
                        showVal = num1;
                      } else {
                        num2 += "2";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("2"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "3";
                        showVal = num1;
                      } else {
                        num2 += "3";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("3"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "*";
                    });
                  },
                  child: Text("*"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        num1 += "0";
                        showVal = num1;
                      } else {
                        num2 += "0";
                        showVal = num2;
                      }
                    });
                  },
                  child: Text("0"),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      num1 = "";
                      num2 = "";
                      showVal = "0";
                      operator = "";
                    });
                  },
                  child: Text("C", style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.deepPurple,
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (num1 == "" || num2 == "") return;

                      double newNum1 = double.parse(num1);
                      double result = 0;

                      if (operator == "√") {
                        result = sqrt(newNum1);
                      } else {
                        if (num2 == "") return;
                        double newNum2 = double.parse(num2);

                        if (operator == "+") result = newNum1 + newNum2;
                        if (operator == "-") result = newNum1 + newNum2;
                        if (operator == "*") result = newNum1 + newNum2;
                        if (operator == "/") result = newNum1 + newNum2;

                        if (operator == "%") {
                          result = (newNum1 / 100) * newNum2;
                        }

                        if (operator == "^") {
                          result = pow(newNum1, newNum2).toDouble();
                        }
                      }

                      showVal = result.toString();
                      // num1 = "";
                      num1 = result.toString();
                      num2 = "";
                      operator = "";
                    });
                  },
                  child: Text("="),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "/";
                    });
                  },
                  child: Text("/"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (operator.isEmpty) {
                        if (num1.isNotEmpty) {
                          num1 = num1.substring(0, num1.length - 1);
                          showVal = num1.isEmpty ? "0" : num1;
                        }
                      } else {
                        if (num2.isNotEmpty) {
                          num2 = num2.substring(0, num2.length - 1);
                          showVal = num2.isEmpty ? "0" : num2;
                        }
                      }
                    });
                  },
                  child: Text("DEL", style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.lightBlue,
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator = "%";
                    });
                  },
                  child: Text("%", style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.red,
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      operator =  "^";
                    });
                  },
                  child: Text("^", style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.red,
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (num1.isEmpty) return;

                      double value = double.parse(num1);
                      double result = sqrt(value);

                      showVal = result.toString();
                      num1 = result.toString();
                      num2 = "";
                      operator = "";
                    });
                  },
                  child: Text("√", style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
} 
