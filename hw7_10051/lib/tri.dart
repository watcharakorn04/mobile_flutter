import 'package:flutter/material.dart';

class Tri extends StatelessWidget {
  final double height;
  final double base;
  final String type;

  const Tri({super.key, required this.height, required this.base, required this.type});

  @override
  Widget build(BuildContext context) {
    double area = 0.5 * base * height;
    double volume = (1 / 3) * (0.5 * base * height) * height;
    bool isArea = type.toLowerCase() == "area";
    double result = isArea ? area : volume;

    return Scaffold(
      appBar: AppBar(title: Text(isArea ? "Triangle Area" : "Triangle Volume"), backgroundColor: Colors.redAccent, foregroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.change_history, size: 80, color: Colors.redAccent),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Base: $base | Height: $height', style: const TextStyle(fontSize: 16)),
                      const Divider(height: 30),
                      const Text("Result", style: TextStyle(color: Colors.grey)),
                      Text(result.toStringAsFixed(2), style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.redAccent)),
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