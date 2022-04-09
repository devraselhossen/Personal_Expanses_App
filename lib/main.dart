// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:add_product_demo/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Color.fromRGBO(255, 193, 7, 1),
          fontFamily: "Lato",
          errorColor: Colors.red,
          textTheme: TextTheme(
            titleMedium: TextStyle(
                fontFamily: "PlayfairDisplay",
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 19),
          ),
          appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),
          )),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
