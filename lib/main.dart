import 'package:flutter/material.dart';
import 'package:instagramflutter/style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/rendering.dart';

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
  var data = [];


  getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    //jsonDecode는 받아온 데이터를 리스트 형태로 만들어준다
    var result2 = jsonDecode(result.body);
    print(result2[0]);
    setState(() {
      data = result2;
    });
  }

  //자식에서 만든 data를 추가해주는 메서드
  addData(a){
    setState(() {
      data.add(a);
    });
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
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (c){return Upload();})
                );
              },
              icon: Icon(Icons.add_box_outlined),
              iconSize: 30,
          )
        ],
      ),
      body: [Home(data : data, addData : addData), Text("샵페이지")][tab],
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

class Home extends StatefulWidget {
  Home({Key? key, this.data, this.addData}) : super(key: key);
  final data;
  final addData;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var scroll = ScrollController();

  getExtraData()async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json'));
    var result2 = jsonDecode(result.body);
    widget.addData(result2);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //사용자가 얼마나 화면을 스크롤 했는지 알 수 있다
    scroll.addListener((){
      //유저가 스크롤을 맨 밑까지 했는지 확인하는 코드
      if(scroll.position.pixels == scroll.position.maxScrollExtent){
        getExtraData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //즉 데이터가 들어오면 밑의 코드를 실행한다!
    if(widget.data.isNotEmpty){
      return ListView.builder(itemCount:3, controller: scroll ,itemBuilder: (c, i){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.data[i]['image']),
            Text("좋아요 ${widget.data[i]['likes']}"),
            Text(widget.data[i]['user']),
            Text(widget.data[i]['content'])
          ],
        );
      });
    }else{
      return Text('로딩중');
    }
  }
}

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('이미지 업로드 화면'),
        ],
      ),
    );
  }
}


