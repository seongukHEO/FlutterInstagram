import 'package:flutter/material.dart';
import 'package:instagramflutter/style.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    //그니까 테마를 따로 정해준다
    //안드로이드도 이미 만들어져있는 theme를 사용한다
    theme: theme,
    home: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.add_box_outlined),
              iconSize: 30,
          )
        ],
      ),
      body: Text('안녕'),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.home_outlined),
                iconSize: 30,
            ),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.shopping_bag_outlined),
                iconSize: 30,
            )
          ],
        ),
      ),
    );
  }
}
