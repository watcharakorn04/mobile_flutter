import 'package:flutter/material.dart';
import 'foodMenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<FoodMenu> menu = [
    FoodMenu("ข้าวผัดหมู", "50"),
    FoodMenu("ผัดกะเพราไก่", "50"),
    FoodMenu("ต้มยำกุ้ง", "60"),
    FoodMenu("ส้มตำ", "30"),
    FoodMenu("ปีกไก่ทอด", "35"),
  ];

  List<Widget> getData(int count) {
    List<Widget> data = [];

    data.add(
      Text(
        "กดปุ่ม เพื่อเพิ่มค่า ตัวเลข",
        style: TextStyle(fontSize: 20, color: Colors.red),
      ),
    );

    data.add(Text(_counter.toString(), style: TextStyle(fontSize: 40)));

    for (var i = 1; i <= count; i++) {
      var menu = ListTile(
        title: Text(
          "เมนูที่ $i",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        subtitle: Text("หัวข้อย่อยที่ $i"),
      );
      data.add(menu);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text("Flutter Menu"),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          FoodMenu food = menu[index];
          return ListTile(
            title: Text("เมนูที่ ${index + 1}"),
            subtitle: Text(food.name + " ราคา " + food.price + " บาท"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
