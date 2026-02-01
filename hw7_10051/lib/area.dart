import 'package:flutter/material.dart';
import 'rec.dart';
import 'tri.dart';
import 'cir.dart';

class Area extends StatefulWidget {
  const Area({super.key});

  @override
  State<Area> createState() => AreaState();
}

class AreaState extends State<Area> {
  String selectedShape = 'Rectangle';
  String type = 'Area';

  final heightController = TextEditingController();
  final widthController = TextEditingController();
  final lengthController = TextEditingController();
  final baseController = TextEditingController();
  final radiusController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    final number = double.tryParse(value);
    if (number == null || number <= 0) {
      return 'Please enter a valid positive number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Geometric Area Calculator"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile<String>(
                title: Text("Rectangle"),
                value: 'Rectangle',
                groupValue: selectedShape,
                onChanged: (value) {
                  setState(() {
                    selectedShape = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text("Triangle"),
                value: 'Triangle',
                groupValue: selectedShape,
                onChanged: (value) {
                  setState(() {
                    selectedShape = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text("Circle"),
                value: 'Circle',
                groupValue: selectedShape,
                onChanged: (value) {
                  setState(() {
                    selectedShape = value!;
                  });
                },
              ),
              if (selectedShape == 'Rectangle') ...[
                TextFormField(
                  controller: heightController,
                  decoration: InputDecoration(labelText: 'Height'),
                  keyboardType: TextInputType.number,
                  validator: validateNumber,
                ),
                TextFormField(
                  controller: widthController,
                  decoration: InputDecoration(labelText: 'Width'),
                  keyboardType: TextInputType.number,
                  validator: validateNumber,
                ),
              ],
              if (selectedShape == 'Triangle') ...[
                TextFormField(
                  controller: baseController,
                  decoration: InputDecoration(labelText: 'Base'),
                  keyboardType: TextInputType.number,
                  validator: validateNumber,
                ),
                TextFormField(
                  controller: heightController,
                  decoration: InputDecoration(labelText: 'Height'),
                  keyboardType: TextInputType.number,
                  validator: validateNumber,
                ),
              ],
              if (selectedShape == 'Circle') ...[
                TextFormField(
                  controller: radiusController,
                  decoration: InputDecoration(labelText: 'Radius'),
                  keyboardType: TextInputType.number,
                  validator: validateNumber,
                ),
              ],
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    if (selectedShape == 'Rectangle') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Rec(
                            height: double.parse(heightController.text),
                            width: double.parse(widthController.text),
                            length: 0,
                            type: type,
                          ),
                        ),
                      );
                    } else if (selectedShape == 'Triangle') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Tri(
                            height: double.parse(heightController.text),
                            base: double.parse(baseController.text),
                            type: type,
                          ),
                        ),
                      );
                    } else if (selectedShape == 'Circle') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Cir(
                            radius: double.parse(radiusController.text),
                            type: type,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text("Calculate Area"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
