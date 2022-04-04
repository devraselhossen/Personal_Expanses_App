// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:add_product_demo/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: "OpenSans",

        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: "OpenSans",
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16
          )
        ),

        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            fontFamily: "QuickSand",
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white
          )
        )

      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}