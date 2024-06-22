import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<Store1>().name),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.account_circle),
            Text('팔로워 : ${context.watch<Store1>().follower}명'),
            ElevatedButton(
                onPressed: (){
                  context.read<Store1>().changeFollower();
                },
                child: Text('팔로우')
            )
          ],
        ),
      )
    );
  }
}
