import 'package:flutter/material.dart';


var theme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(
        color: Colors.white,
        //그림자
        elevation: 1,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
        actionsIconTheme: IconThemeData(color: Colors.black)),
    textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.black)
    )

);