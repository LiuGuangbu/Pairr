import 'package:flutter/material.dart';

import 'news_writting.dart';

class NewsPage extends StatelessWidget{
  var imgUrl = 'lib/images/login4jpg';
  var newsName ="全部随记";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title:  Row(
          // mainAxisAlignment: ,
          children: <Widget>[
            new Expanded(child: new Container(
                //alignment: Alignment.center,
                child: Text(newsName)),),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsWritting()));
              },
            )
          ],)),
        body: Container(
          child: ListView(
            children: <Widget>[
    ],
        ),),
        //Text('记诗所爱，随从本心'),
        drawer: new Drawer(
          child: new Container(
            color: const Color(0xfff1f2f3),
            child: ListView(
              children: <Widget>[

                new Container(

                  decoration: BoxDecoration(

                    border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: new Image.asset('lib/images/login4.jpg',height:150.0,fit: BoxFit.cover,),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text('全部随记'),
                    trailing: Text('0'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('我的收藏'),
                    trailing: Text('0'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 5,color: Color(0xffe5e5e5))),),
                  child:  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('最近删除'),
                    trailing: Text('0'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    title: Text('随记分类'),
                    trailing: Text('编辑'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    leading: Icon(Icons.book,color: Colors.tealAccent,),
                    title: Text('叙事'),
                    trailing: Text('0'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    leading: Icon(Icons.book,color: Colors.lightBlueAccent,),
                    title: Text('抒情'),
                    trailing: Text('0'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    leading: Icon(Icons.book,color: Colors.lightGreen,),
                    title: Text('送别'),
                    trailing: Text('0'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    leading: Icon(Icons.book,color: Colors.indigoAccent,),
                    title: Text('山水田园'),
                    trailing: Text('0'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    leading: Icon(Icons.book,color: Colors.pink,),
                    title: Text('咏物'),
                    trailing: Text('0'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    leading: Icon(Icons.book,color: Colors.yellow,),
                    title: Text('讽喻'),
                    trailing: Text('0'),
                  ),
                ),
                new Container(
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.5,color: Color(0xffe5e5e5))),),
                  child: ListTile(
                    leading: Icon(Icons.book,color: Colors.grey,),
                    title: Text('怀古'),
                    trailing: Text('0'),
                  ),
                ),






              ],
            ),
//            new Column(
//              children: <Widget>[
//                new Image.network(this.imgUrl),
//
//                new Container(
//                  padding: new EdgeInsets.all(20.0),
//                  child: new Row(
//                    children: <Widget>[
//                      new Icon(Icons.home, color: Colors.black87),
//                      new Text('首页'),
//                    ],
//                  ),
//                )
//              ],
//            ),
          ),
        )
    );
  }

}
