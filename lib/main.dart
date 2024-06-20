import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    //그니까 테마를 따로 정해준다
    //안드로이드도 이미 만들어져있는 theme를 사용한다
    theme: ThemeData(
      iconTheme: IconThemeData(color: Colors.blue),
      appBarTheme: AppBarTheme(color: Colors.white, actionsIconTheme: IconThemeData(color: Colors.black)),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.red)
      )

    ),
    home: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.add_box_outlined)
        ],
        title: Text("Instagram"),
      ),
      body: Text("dk"),
    );
  }
}
