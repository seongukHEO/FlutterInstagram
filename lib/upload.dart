import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key ,this.userImg}) : super(key: key);
  final userImg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.file(userImg),
          Text('이미지 업로드 화면'),
          TextField(),
        ],
      ),
    );
  }
}