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
            Text(showVal.toString(), style: TextStyle(fontSize: 40)),
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
                      double newNum2 = double.parse(num2);
                      double result = 0;

                      if (operator == "+") result = newNum1 + newNum2;
                      if (operator == "-") result = newNum1 - newNum2;
                      if (operator == "*") result = newNum1 * newNum2;
                      if (operator == "/") result = newNum1 / newNum2;

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
          ],
        ),
      ),
    );
  }
}
