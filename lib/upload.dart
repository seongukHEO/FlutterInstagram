import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key ,this.userImg, this.userContent, this.addMyData }) : super(key: key);
  final userImg;
  final userContent;
  final addMyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                addMyData();
              },
              icon: Icon(Icons.send)
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(userImg),
          Text('이미지 업로드 화면'),
          TextField(
            onChanged: (text){
              userContent(text);
            },
          ),
        ],
      ),
    );
  }
}