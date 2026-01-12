import 'package:flutter/material.dart';
import 'display.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _controller = TextEditingController();
  String? errorText;

  void checkOddEven() {
    if (_controller.text.isEmpty) {
      setState(() {
        errorText = 'Please enter a number';
      });
      return;
    }

    final int? number = int.tryParse(_controller.text);

    if (number == null) {
      setState(() {
        errorText = 'Invalid number';
      });
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DisplayPage(number: number)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('w_10051 Form Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a number',
                errorText: errorText,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkOddEven,
              child: const Text('Check Number'),
            ),
          ],
        ),
      ),
    );
  }
}
