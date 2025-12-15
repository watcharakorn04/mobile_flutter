import 'package:flutter/material.dart';

void main() {
  runApp(AppTest2());
}

class AppTest2 extends StatelessWidget {
  const AppTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "MyApp", home: MyhomePage());
  }
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key});

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("10051 Watcharakorn Choosriying")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(
                "https://scontent-bkk1-1.xx.fbcdn.net/v/t39.30808-6/466130498_1867027907160948_1344641734850969915_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=achYqayV0doQ7kNvwFk4ZcC&_nc_oc=AdmU9tmTnH8VDRFSEVV66qjmr2GLUqF1Y-a1fZdpoVvHDAsXXdICbMpJRs2GjMq7HeE&_nc_zt=23&_nc_ht=scontent-bkk1-1.xx&_nc_gid=w5sj_3ZL3wQyarybJZnRcw&oh=00_Afj90-cZm3u2RGQWKPjb0xcYk8CgsRJLvH7PUyf3hYDsfQ&oe=6932EE06",
                scale: 7,
              ),
            ),
            Text("กดปุ่ม เพิ่มค่าตัวเลข", style: TextStyle(fontSize: 30)),
            Text(number.toString(), style: TextStyle(fontSize: 30)),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              child: Icon(Icons.add),
            ),

            FloatingActionButton(
              onPressed: () {
                setState(() {
                  number--;
                });
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
        // child: Text(
        //   "Hello BODY SLAM",
        //   style: TextStyle(fontSize: 30, color: Colors.blue),
        // ),
      ),
    );
  }
}
