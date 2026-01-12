import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final int number;

  const DisplayPage({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    bool isEven = number % 2 == 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Display Page')),
      body: Column(
        children: [
          Text('The number: $number', style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Text(
            isEven ? 'The number is Even' : 'The number is Odd',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Image.asset(
            isEven ? 'assets/images/pic2.png' : 'assets/images/pic1.png',
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back'),
          ),
        ],
      ),
    );
  }
}
