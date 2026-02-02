import 'package:flutter/material.dart';

class Cir extends StatelessWidget {
  final double radius;
  final String type;

  const Cir({super.key, required this.radius, required this.type});

  @override
  Widget build(BuildContext context) {
    double area = (22 / 7) * radius * radius;
    double volume = (4 / 3) * (22 / 7) * radius * radius * radius;
    bool isArea = type.toLowerCase() == "area";
    double result = isArea ? area : volume;

    return Scaffold(
      appBar: AppBar(title: Text(isArea ? "Circle Area" : "Circle Volume"), backgroundColor: Colors.green, foregroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.circle_outlined, size: 80, color: Colors.green),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Radius: $radius', style: const TextStyle(fontSize: 16)),
                      const Divider(height: 30),
                      const Text("Result", style: TextStyle(color: Colors.grey)),
                      Text(result.toStringAsFixed(2), style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text("Back")),
            ],
          ),
        ),
      ),
    );
  }
}