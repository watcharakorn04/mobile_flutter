import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listview Widget',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
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

  List<Widget> getData(int count) {
    List<Widget> data = [];
    data.add(
      Text(
        "กดปุ่มเพื่อเพิ่มค่าตัวเลข",
        style: TextStyle(fontSize: 40, color: Colors.red),
      ),
    );
    for (int i = 1; i <= count; i++) {
      var menu = ListTile(
        title: Text(
          "Menu $i",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
        subtitle: Text("sub-Menu $i"),
      );
      data.add(menu);
    }
    return data;
  }

  int menu = 0;

  void _incrementCounter() {
    setState(() {
      menu++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (menu > 0){
        menu--;
      }else{
        menu=0;
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("HW4 List View-10051"),
      ),

        floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ),
          const Padding(padding:  EdgeInsets.only(top: 10)),
          FloatingActionButton(
            onPressed: _decrementCounter,
            child: const Icon(Icons.remove),
          )
          ]
        ),

      body: Container(
            child: 
            ListView.builder(
              itemCount: menu,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
            
                  title: Text(
                    "เมนูที่  ${index + 1}. ",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),                          
                );
              },
            ),
            ),
    );
  }
}