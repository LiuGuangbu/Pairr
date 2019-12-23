import 'package:flutter/material.dart';
import 'widget_animated_up_arrow.dart';
import 'package:text03/photo/photo.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          new Center(
            child:HomePage() ,
          ),
//          Image.asset(
//            "images/black_bg.jpg",
//            height: double.infinity,
//            fit: BoxFit.cover,
//          ),
          Positioned(
            child: AnimatedUpArrowWidget(),
            bottom: 0,
          )
        ],
      ),
    );
  }
}