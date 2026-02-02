import 'package:flutter/material.dart';

class Rec extends StatelessWidget {
  final double height;
  final double width;
  final double length;
  final String type;

  const Rec({super.key, required this.height, required this.width, required this.length, required this.type});

  @override
  Widget build(BuildContext context) {
    double area = height * width;
    double volume = height * width * length;
    bool isArea = type.toLowerCase() == "area";
    double result = isArea ? area : volume;

    return Scaffold(
      appBar: AppBar(title: Text(isArea ? "Rectangle Area" : "Rectangle Volume"), backgroundColor: Colors.orangeAccent, foregroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.view_in_ar, size: 80, color: Colors.orangeAccent),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text('Height: $height | Width: $width', style: const TextStyle(fontSize: 16)),
                      if (!isArea) Text('Length: $length', style: const TextStyle(fontSize: 16)),
                      const Divider(height: 30),
                      const Text("Result", style: TextStyle(color: Colors.grey)),
                      Text(result.toStringAsFixed(2), style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.orangeAccent)),
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