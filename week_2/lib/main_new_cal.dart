import 'package:flutter/material.dart';
import 'package:week2_1/main-basic_cal_old.dart';

void main() {
  runApp(MyST());
}

class MyST extends StatelessWidget {
  const MyST({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "NEW CAL", home: MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String num1 = "";
  String num2 = "";
  String operator = "";
  String display = "0";

  Widget calcBtn(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 22)),
      ),
    );
  }

  void pressNumber(String value) {
    setState(() {
      if (operator.isEmpty) {
        num1 += value;
        display = num1;
      } else {
        num2 += value;
        display = num2;
      }
    });
  }

  void pressOperator(String op) {
    setState(() {
      operator = op;
    });
  }

  void clear() {
    setState(() {
      num1 = "";
      num2 = "";
      operator = "";
      display = "0";
    });
  }

  void calculate() {
    if (num1.isEmpty || num2.isEmpty || operator.isEmpty) return;

    double n1 = double.parse(num1);
    double n2 = double.parse(num2);
    double result = 0;

    switch (operator) {
      case "+":
        result = n1 + n2;
        break;
      case "-":
        result = n1 - n2;
        break;
      case "*":
        result = n1 * n2;
        break;
      case "/":
        result = n1 / n2;
        break;
    }
    setState(() {
      display = result.toString();
      num1 = result.toString();
      num2 = "";
      operator = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New CAL")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(display, style: TextStyle(fontSize: 40, color: Colors.red)),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("7", () => pressNumber("7")),
                calcBtn("8", () => pressNumber("8")),
                calcBtn("9", () => pressNumber("9")),
                calcBtn("+", () => pressOperator("+")),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("4", () => pressNumber("4")),
                calcBtn("5", () => pressNumber("5")),
                calcBtn("6", () => pressNumber("6")),
                calcBtn("-", () => pressOperator("-")),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("1", () => pressNumber("1")),
                calcBtn("2", () => pressNumber("2")),
                calcBtn("3", () => pressNumber("3")),
                calcBtn("*", () => pressOperator("*")),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calcBtn("0", () => pressNumber("0")),
                calcBtn("C", clear),
                calcBtn("=", calculate),
                calcBtn("/", () => pressOperator("/")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
