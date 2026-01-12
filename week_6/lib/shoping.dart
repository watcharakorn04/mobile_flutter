import 'package:flutter/material.dart';

class formShopping extends StatelessWidget {
  // const formShopping({super.key});
  formShopping({Key? key, required this.productName}) : super(key: key);
  String productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shopping Screen")),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Customer Name: ${productName}"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go back!!"),
            ),
          ],
        ),
      ),
    );
  }
}
