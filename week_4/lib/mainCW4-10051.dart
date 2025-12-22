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
    FoodMenu("ข้าวผัดกะเพราหมูสับ", "65", "assets/images/m1.jpg", "ผัด"),
    FoodMenu("ผัดไทกุ้งสด", "70", "assets/images/m2.jpg", "ผัด"),
    FoodMenu("ซูชิ 6 ชิ้น", "60", "assets/images/m3.jpg", "ดิบ"),
    FoodMenu("บาบีคิว 10 ไม้", "100", "assets/images/m4.jpg", "ย่าง"),
    FoodMenu("ซาลาเปา 3 ลูก", "50", "assets/images/m5.jpg", "นึ่ง"),
    FoodMenu("กุ้งเผา", "250", "assets/images/m6.jpg", "ย่าง"),
    FoodMenu("แกงจืดมะระหมูสับ", "50", "assets/images/m7.jpg", "ต้ม"),
    FoodMenu("ปลาทอด", "80", "assets/images/m8.jpg", "ทอด"),
    FoodMenu("แหนมเนือง", "55", "assets/images/m9.jpg", "ลวก"),
    FoodMenu("แฮมเบอร์เกอร์", "99", "assets/images/m10.jpg", "ย่าง"),

    FoodMenu("ปีกไก่ทอด", "40", "assets/images/m11.jpg", "ทอด"),
    FoodMenu("ผัดซีอิ้วหมู", "70", "assets/images/m12.jpg", "ผัด"),
    FoodMenu("ข้าวหมูกรอบ", "65", "assets/images/m13.jpg", "ทอด"),
    FoodMenu("ก๋วยเตี๋ยวต้มยำ", "55", "assets/images/m14.jpg", "ต้ม"),
    FoodMenu("ซาชิมิแซลมอน", "320", "assets/images/m15.jpg", "ดิบ"),
    FoodMenu("กุ้งแช่น้ำปลา", "110", "assets/images/m16.jpg", "ดิบ"),
    FoodMenu("เสือร้องไห้", "120", "assets/images/m17.jpg", "ย่าง"),
    FoodMenu("หมูทอดแดดเดียว", "80", "assets/images/m18.jpg", "ทอด"),
    FoodMenu("ไก่ย่าง 1 ตัว", "160", "assets/images/m19.jpg", "ย่าง"),
    FoodMenu("ต้มยํากุ้ง", "90", "assets/images/m20.jpg", "ต้ม"),
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
    int totalprice = 0;
    int totalitem = 0;

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
            leading: Image.asset(
              food.img,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            title: Text(
              "เมนูที่ ${index + 1}" + ". " + food.name,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              "ประเภท " + food.type + "\nราคา " + food.price + " บาท",
            ),
            onTap: () {
              totalprice += int.parse(food.price);
              totalitem++;

              AlertDialog alert = AlertDialog(
                title: Text("คุณเลือกเมนู " + food.name),
                content: Text(
                  "ราคา " +
                      food.price +
                      " บาท\n\nรวม " +
                      totalitem.toString() +
                      " รายการ\nรวมเป็นเงิน " +
                      totalprice.toString() +
                      " บาท",
                ),
                actions: [
                  ElevatedButton(
                    child: Text("ตกลง"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
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
