import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix1;
import 'package:login/Pages/Poem_page/add_Poem.dart';
import 'dart:ui';
import 'package:login/Pages/Poem_page/poem_Show1.dart';
import 'package:login/Pages/Poem_page/poem_Show.dart';
import 'package:login/Pages/Poem_page/poem_listview.dart';


class SearchBarDemoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _SearchBarDemoPageState();
}

class _SearchBarDemoPageState extends State<SearchBarDemoPage> {
  //焦点
  FocusNode _focusNodeSearch = new FocusNode();
//输入框控制器，此控制器可以监听用户输入框操作
  TextEditingController _searchController = new TextEditingController();
  //final controller = TextEditingController();
  var searpart;
  var _isShowClear = false;
  List list =[];//搜索历史数值
  void _searchClear(String s){//删除搜索历史某个数值，更新
    setState(() {
      list.remove(s);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    //设置焦点监听
    _focusNodeSearch.addListener(_focusNodeListener);
    //监听用户名框的输入改变
    _searchController.addListener(() {
      print(_searchController.text);

      // 监听文本框输入变化，当有内容的时候，显示尾部清除按钮，否则不显示
      if (_searchController.text.length > 0) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      setState(() {

      });
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    // 移除焦点监听
    _focusNodeSearch.removeListener(_focusNodeListener);
    _searchController.dispose();
    super.dispose();
  }
  // 监听焦点
  Future<Null> _focusNodeListener() async {
    if (_focusNodeSearch.hasFocus) {
      _focusNodeSearch.unfocus();

      print("搜索框获取焦点");
      // 取消搜索框的焦点状态

    }

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:GestureDetector(
        onTap: (){
          print('点击了空白区域');
          _focusNodeSearch.unfocus();
        },
        child:
              Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQueryData.fromWindow(window).padding.top,),
                child:  new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          new Expanded(child:
                          new Card(
                              child: new Container(
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                                  border: new Border.all(width: 2.0, color: Colors.red),
                                ),
                                padding: EdgeInsets.only(right: 10),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    //SizedBox(width: 5.0,),
                                    new IconButton(
                                      icon: new Icon(Icons.search),
                                      color: Colors.grey,
                                      iconSize: 30.0,
                                      onPressed: () {
                                        print(_searchController);
                                        searpart=_searchController.text;
                                        print(searpart);
                                        list.add(searpart);
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => MyHomePage()));


                                      },
                                    ),
                                    // Icon(Icons.search, size:30,color: Colors.grey,),
                                    Expanded(
                                        child: Container(

                                          alignment: Alignment.center,
                                          child: TextFormField(

                                            controller: _searchController,
                                          //  focusNode: _focusNodeSearch,

                                            style: TextStyle(fontSize: 25,fontFamily: 'FontJian'),
                                            decoration: new InputDecoration(
                                             // contentPadding: EdgeInsets.only(top: 1.0),
                                              hintText: 'Search',
                                              //focusColor: Colors.white,
                                              hintStyle: TextStyle(color: Colors.black12),
                                              border: InputBorder.none,
                                              suffixIcon:IconButton(
                                                  icon: Icon((_isShowClear)?Icons.cancel:Icons.keyboard_voice), onPressed:
                                              (){
                                                    _searchController.clear();
                                              }),
                                            ) ,
                                          ),
                                        )),

                                  ],
                                ),
                              )
                          ),
                          ),
                          new Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: new RaisedButton(onPressed: (){
                              _focusNodeSearch.unfocus();
                              print(_searchController);
                              searpart=_searchController.text;
                              print(searpart);
                              if(searpart.isEmpty)//这还是有问题
                                list.add(searpart);
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => PoemsListView()));
                            },
                              color: Colors.grey[100],
                              splashColor: Colors.red,
                              child: Text('搜索',style: TextStyle(fontSize: 15,fontFamily: 'FontJian'),),)
                          )

                        ],
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
                  //elevation:20,//背景阴影颜色
                  // shadowColor:Colors.lime,
                ),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 10.0,
                  children: <Widget>[
                    Chip(label: Text('梅花',style: TextStyle(fontFamily: 'FontShou',fontSize: 20),),),
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
                              _searchClear('${list[index]}');

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
      )

    );
  }
}


