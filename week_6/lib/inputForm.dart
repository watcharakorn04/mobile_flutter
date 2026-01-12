import 'package:flutter/material.dart';
import 'shoping.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  var _productName;
  var _customerName;

  final _productController = TextEditingController();
  final _customerController = TextEditingController();

  void initState() {
    super.initState();
    _productController.addListener(_updateText);
    _customerController.addListener(_updateText);
  }

  void _updateText() {
    setState(() {
      _productName = _productController.text;
      _customerName = _customerController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("APP BAR")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("INPUT FORM", style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            TextField(
              controller: _productController,
              decoration: InputDecoration(
                labelText: "Product Name",
                prefixIcon: Icon(Icons.verified_user_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _customerController,
              decoration: InputDecoration(
                labelText: "Customer Name",
                prefixIcon: Icon(Icons.verified_user_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return formShopping(productName: _productController.text);
                    },
                  ),
                );
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 20),
            Text("Product Name is ${_productController.text}"),
            SizedBox(height: 10),
            Text("Customer Name is ${_customerController.text}"),
          ],
        ),
      ),
    );
  }
}
