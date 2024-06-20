import 'package:flutter/material.dart';
import 'package:instagramflutter/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
    //그니까 테마를 따로 정해준다
    //안드로이드도 이미 만들어져있는 theme를 사용한다
    theme: theme,
    home: MyApp())
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;


  getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    //jsonDecode는 받아온 데이터를 리스트 형태로 만들어준다
    var result2 = jsonDecode(result.body);
    print(result2[0]['likes']);
  }



  //안드로이드의 init 즉 MyApp이 로드될때 바로 인스턴스에 올라간다
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }


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
      body: [Home(), Text("샵페이지")][tab],
      bottomNavigationBar: BottomNavigationBar(
        //여기서 i는 순서값이다
        onTap: (i){
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: '샵')
        ],
      ),

    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount:3, itemBuilder: (c, i){
      return Column(
        children: [
          Image.network("https://codingapple1.github.io/app/car0.png"),
          Text("좋아요 100"),
          Text("글쓴이"),
          Text("글내용")
        ],
      );
    });
  }
}

