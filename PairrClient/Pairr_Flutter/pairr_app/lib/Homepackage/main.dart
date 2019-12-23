import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,  //定义主题风格    primarySwatch
      ),
      home: new SplashScreen(),
    );
  }
}