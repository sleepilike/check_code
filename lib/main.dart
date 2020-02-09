import 'package:flutter/material.dart';
import 'package:registration_staff/ui/loginpage/login.dart';
import 'package:registration_staff/ui/mainpage/mainpage.dart';



void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "广东省农业科学院防疫信息系统",
      home: LoginPage(),
    );


  }
}
