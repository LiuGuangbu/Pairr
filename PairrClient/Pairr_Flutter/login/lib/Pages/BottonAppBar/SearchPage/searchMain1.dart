import 'package:flutter/cupertino.dart';


import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:login/Pages/Poem_page/poem_Show1.dart';
//import 'package:login/Pages/Poem_page/zhengwen.dart';

class SearchBarDemoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _SearchBarDemoPageState();
}

class _SearchBarDemoPageState extends State<SearchBarDemoPage> {

  final controller = TextEditingController();
  var searpart;
  int _selectedIndex = 0;
  List list =['dfjjakdf','ff积极'];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top,),
                child: Container(
                  height: 70.0,
                  child: new Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Card(
                          child: new Container(
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //SizedBox(width: 5.0,),
                                new IconButton(
                                  icon: new Icon(Icons.search),
                                  color: Colors.grey,
                                  iconSize: 30.0,
                                  onPressed: () {
                                    print(controller);
                                    searpart=controller.text;
                                    print(searpart);
                                    list.add(searpart);
                                    // Wrap();
//                              Navigator.push(context,
//                                  MaterialPageRoute(builder: (context) => ));

                                  },
                                ),
                                // Icon(Icons.search, size:30,color: Colors.grey,),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: TextField(
                                      controller: controller,
                                      style: TextStyle(fontSize: 18,fontFamily: 'FontJian'),
                                      decoration: new InputDecoration(

                                          contentPadding: EdgeInsets.only(top: 0.0),
                                          hintText: 'Search', border: InputBorder.none),
                                      // onChanged: onSearchTextChanged,
                                    ),
                                  ),
                                ),
                                new IconButton(
                                  icon: new Icon(Icons.cancel),
                                  color: Colors.grey,
                                  iconSize: 25.0,
                                  onPressed: () {
                                    controller.clear();
                                    // onSearchTextChanged('');
                                  },
                                ),
                              ],
                            ),
                          )
                      )
                  ),
                ),
              ),
            ),
            new Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(40, 20, 0, 20),
              child: Text('热搜',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'FontJian',
                ),),
            ),
            new Container(
              child: ChipTheme(
//统一设置Chip组件样式
                data: ChipThemeData(
                  backgroundColor:Colors.white,
                  disabledColor:Colors.white,
                  selectedColor:Colors.white,
                  secondarySelectedColor:Colors.white,
                  labelPadding:EdgeInsets.fromLTRB(10, 10, 10,10),
                  padding:EdgeInsets.all(0),
                  shape: StadiumBorder(side: BorderSide(width: 2, style: BorderStyle.solid, color: Colors.red)),
                  labelStyle:TextStyle(color: Colors.black),
                  secondaryLabelStyle:TextStyle(color: Colors.white),
                  brightness:Brightness.dark,
                  elevation:20,
                  // shadowColor:Colors.lime,//阴影颜色添加
                ),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 10.0,
                  children: <Widget>[
                    Chip(label: Text('梅花',style: TextStyle(fontFamily: 'FontShou',fontSize: 20),),onDeleted: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PoemsListView()));
                    },),
                    Chip(label: Text('繁花似锦',style: TextStyle(fontFamily: 'FontShou',fontSize: 20),),),
                    Chip(label: Text('中秋节',style: TextStyle(fontFamily: 'FontShou',fontSize: 20),),),
                    Chip(label: Text('爱情诗',style: TextStyle(fontFamily: 'FontShou',fontSize: 20),),),
                    Chip(label: Text('爱我中华',style: TextStyle(fontFamily: 'FontShou',fontSize: 20),),),
                    Chip(label: Text('陶渊明',style: TextStyle(fontFamily: 'FontShou',fontSize: 20),),),
                    Chip(label: Text('李白',style: TextStyle(fontFamily: 'FontShou',fontSize: 20),),),
                    Chip(label: Text('惆怅',style: TextStyle(fontFamily: 'FontShou',fontSize: 20),),),

                  ],
                ),
              ),
            ),
//单个标签添加
//            new Container(
//              child:
//              Chip(
//                avatar: Icon(Icons.add_alert),
//                label: Text('buttom'),
//                deleteIcon: Icon(Icons.close),
//                deleteIconColor:Colors.red,
//                deleteButtonTooltipMessage:'干啥',
//                labelStyle: TextStyle(color: Colors.white),
//                backgroundColor: Colors.blue,
//                elevation:20,
//                shadowColor:Colors.red,
//                onDeleted: (){
//                  print('object');
//                },
//              ),
//            ),
            new Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
              child: Text('搜索历史',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'FontJian',
                ),),
            ),
            new Expanded(
                child:ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context,int index){
                    return Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child:Row(
                        children: <Widget>[
                          Expanded(child: Text('${list[index]}',style: TextStyle(fontSize: 25,fontFamily: 'FontShou'),),),
                          IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: (){
                              list.remove('${list[index]}');
                            },
                          )
                        ],
                      ),


                    );
                  },
                ) ),





          ],
        ),
      ),
    );
  }
}


