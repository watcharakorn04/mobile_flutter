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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Menu',
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
    FoodMenu("ข้าวผัดกะเพราหมูสับ + ไข่ดาว", "65", "assets/images/m1.jpg"),
    FoodMenu("ผัดไทกุ้งสด", "70", "assets/images/m2.jpg"),
    FoodMenu("ซูชิ", "60", "assets/images/m3.jpg"),
    FoodMenu("บาบีคิว", "100", "assets/images/m4.jpg"),
    FoodMenu("ซาลาเปา", "50", "assets/images/m5.jpg"),
    FoodMenu("กุ้งเผา", "250", "assets/images/m6.jpg"),
    FoodMenu("แกงจืดมะระหมูสับ", "55", "assets/images/m7.jpg"),
    FoodMenu("ปลาทอด", "80", "assets/images/m8.jpg"),
    FoodMenu("แหนมเนือง", "59", "assets/images/m9.jpg"),
    FoodMenu("แฮมเบอร์เกอร์", "99", "assets/images/m10.jpg"),
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
        title: Text("Menu"),
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          FoodMenu food = menu[index];
          return ListTile(
            leading: Image.asset(food.img),
            title: Text(
              "เมนูที่ ${index + 1}" + "." + food.name,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(" ราคา " + food.price + " บาท"),
            onTap: () {
              AlertDialog alert = AlertDialog(
                title: Text("คุณเลือกเมนู " + food.name),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
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
