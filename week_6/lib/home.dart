import 'package:flutter/material.dart';
import 'shoping.dart';
import 'inputForm.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Bar")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  myBTN(context),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return InputForm();
                          },
                        ),
                      );
                    },
                    child: Text("OUTLINE BUTTON"),
                    style: OutlinedButton.styleFrom(fixedSize: Size(300, 80)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("TEXT BUTTON"),
                    style: TextButton.styleFrom(fixedSize: Size(300, 80)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton myBTN(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Let's Begin"), Icon(Icons.add_shopping_cart_outlined)],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return formShopping();
            },
          ),
        );
      },
      //icon: Icon(Icons.add_shopping_cart_outlined),

      /*
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("AlertDialog Title"),
            content: Text("Alert Dialog Description"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: Text("OK"),
              ),
            ],
          ),
        ),
        */

      //label: Text("Let's Begin."),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        fixedSize: Size(300, 80),
        textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        elevation: 15,
        shadowColor: Colors.yellow,
        side: BorderSide(color: Colors.black87, width: 2),
        shape: StadiumBorder(),
      ),
    );
  }
}
