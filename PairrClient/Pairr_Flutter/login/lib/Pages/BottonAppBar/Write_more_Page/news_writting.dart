import 'package:flutter/material.dart';

class NewsWritting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('随记编辑'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: <Widget>[
              new Container(
                color: Colors.lightBlue,
                height: 20.0,
              ),
              new Expanded(child: Container(
                color: Colors.black12,

              )),
              new Container(
                height: 30.0,
                child:Row(
                  children: <Widget>[

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

