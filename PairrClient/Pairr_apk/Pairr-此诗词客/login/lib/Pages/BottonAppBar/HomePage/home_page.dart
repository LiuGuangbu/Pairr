import 'dart:core' as prefix0;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:login/Pages/BottonAppBar/SearchPage/listView_Poem.dart';

import 'package:login/Pages/Poem_page/add_Poem.dart';

import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';

import 'package:scoped_model/scoped_model.dart';


class home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var text_Family = 'FontQidong';
  var text_Family_Poem ;//= 'HuawenXingkai'; //'ShouJinting';;//= 'MaoZedong';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child:  AppBar(

          title: Row(
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.launch,
                  size: Adapt.px(45),
                  color: Theme.of(context).accentColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: Adapt.px(45),
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            /*
          下面是一个弹出菜单按钮，包含两个属性点击属性和弹出菜单子项的建立
          其中<String>是表示这个弹出菜单的value内容是String类型
           */
            new PopupMenuButton<String>(
                icon: Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).accentColor,
                  size: Adapt.px(45),
                ),
                //这是点击弹出菜单的操作，点击对应菜单后，改变屏幕中间文本状态，将点击的菜单值赋予屏幕中间文本
                //这是弹出菜单的建立，包含了两个子项，分别是增加和删除以及他们对应的值
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                //    color: Theme.of(context).primaryColor,
                                child: ListView(
                                  children: <Widget>[
                                    ListTile(
                                      subtitle: Text('系统字体'),
                                      title: Text(
                                        '此诗词客给你诗意生活',
                                        style: TextStyle(
                                          fontSize: Adapt.px(20),
                                        ),
                                      ),
//                                    trailing: RaisedButton(
//                                      color: Colors.white,
//                                      elevation: 0.0,
//                                      onPressed: (){
//                                        var _text='';
//                                        global.set_text_Family_Poem(_text);
//                                        //_toggleFavortie(_text);
//                                        Navigator.of(context).pop();
//                                      },
//                                      child: Icon(Icons.arrow_downward,color: Colors.black,),
//                                    ),
                                      onTap: () {
                                        setState(() {
                                          var _text = '';
                                          global.set_text_Family_Poem(_text);
                                          //_toggleFavortie(_text);
                                          Navigator.of(context).pop();
                                        });

                                      },
                                    ),
                                    ListTile(
                                      subtitle: Text('毛泽东书法字体'),
                                      title: Text(
                                        '此诗词客给你诗意生活',
                                        style: TextStyle(
                                          fontFamily: 'MaoZedong',
                                          fontSize: Adapt.px(20),
                                        ),
                                      ),
//                                    trailing: RaisedButton(
//                                      color: Colors.white,
//                                      elevation: 0.0,
//                                      onPressed:(){
//                                        setState(() {
//                                          var _text='MaoZedong';
//                                          global.set_text_Family_Poem(_text);
//                                          // _toggleFavortie(_text);
//                                          Navigator.of(context).pop();
//                                        });
//
//                                      },
//                                      child: Icon(Icons.arrow_downward,color: Colors.black),
//                                    ),
//                                    onLongPress: (){
//                                      text_Family_Poem = 'MaoZedong';
//                                    },
                                      onTap: () {
                                        setState(() {
                                          var _text = 'MaoZedong';
                                          global.set_text_Family_Poem(_text);
                                          // _toggleFavortie(_text);
                                          Navigator.of(context).pop();
                                        });
                                      },
                                    ),
                                    ListTile(
                                      subtitle: Text('华文行楷简体字体'),
                                      title: Text(
                                        '此诗词客给你诗意生活',
                                        style: TextStyle(
                                          fontFamily: 'HuawenXingkai',
                                          fontSize: Adapt.px(30),
                                        ),
                                      ),
//                                    trailing: RaisedButton(
//                                      color: Colors.white,
//                                      elevation: 0.0,
//                                      onPressed: (){
//                                        setState(() {
//                                          var _text='HuawenXingkai';
//                                          global.set_text_Family_Poem(_text);
//                                          //  _toggleFavortie(_text);
//                                          Navigator.of(context).pop();
//                                        });
//
//                                      },
//                                      child: Icon(Icons.arrow_downward,color: Colors.black,),
//                                    ),
                                      onTap: () {
                                        setState(() {
                                          var _text = 'HuawenXingkai';
                                          global.set_text_Family_Poem(_text);
                                          // _toggleFavortie(_text);
                                          Navigator.of(context).pop();
                                        });
                                      },
                                    ),
                                    ListTile(
                                      subtitle: Text('方正舒体简体'),
                                      title: Text(
                                        '此诗词客给你诗意生活',
                                        style: TextStyle(
                                          fontFamily: 'FangzhengShuti',
                                          fontSize: Adapt.px(30),
                                        ),
                                      ),
//                                    trailing: RaisedButton(
//                                      color: Colors.white,
//                                      elevation: 0.0,
//                                      onPressed: (){
//                                        setState(() {
//                                          var _text='FangzhengShuti';
//                                          global.set_text_Family_Poem(_text);
//                                          // _toggleFavortie(_text);
//                                          Navigator.of(context).pop();
//                                        });
//
//                                      },
//                                      child: Icon(Icons.arrow_downward,color: Colors.black,),
//                                    ),
                                      onTap: () {
                                        setState(() {
                                          var _text = 'FangzhengShuti';
                                          global.set_text_Family_Poem(_text);
                                          //_toggleFavortie(_text);
                                          Navigator.of(context).pop();
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Text('字体切换'),
                          new Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: ListTile(
                      title: Text('排版'),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                      onTap: () {},
                    ),
                  )
                ])
          ],
        ),
        preferredSize: Size.fromHeight(Adapt.px(90)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: PageViewWidget(),
          )
        ],
      ),
    );
  }
}

class PageViewWidget extends StatefulWidget {
  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  List<VacationBean> _list = VacationBean.generate();
  List get1;
  var text_Family_Poem = global.get_text_Family_Poem(); //'ShouJinting';
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    text_Family_Poem = global.get_text_Family_Poem();
    // _getdata();
    // MainModel _model = MainModel();//用户全局变量控制
    return PageView.builder(
      pageSnapping: true,
      scrollDirection: Axis.horizontal,
      //垂直切换还是水平切换（默认水平，Android原生ViewPage要费很大劲才能实现）
      reverse: false,
      //倒置，设置true页面顺序从后往前，默认false
      onPageChanged: (currentIndex) => debugPrint('当前页面：$currentIndex'),
      //onPageChanged 监听页面改变，输出当前页面序号
      controller: PageController(
          initialPage: 0, //默认显示第几个页面（默认0）
          keepPage: false, //设置为true  initialPage才生效（默认true）
          viewportFraction: 1.0 //默认1，每个页面占可视窗的比例
      ),
      //设置显示个数
      itemCount: 5,
      //_list_length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(Adapt.px(40)),
          child: Opacity(
            opacity: global.getOpacity(),
            child: new GestureDetector(
              onTap: () {
                // var _string =poems_part[index].author+poems_part[index].text1+poems_part[index].text2;
                // print(_string);
                // global.setSearchV(_string);
                // setState(() {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => httpPage()));
                // });
              },
              child: new Container(
                padding: EdgeInsets.fromLTRB(
                    Adapt.px(20.0), Adapt.px(100), Adapt.px(10), Adapt.px(0)),
                //设置背景图片
                decoration: new BoxDecoration(
                  color: Colors.grey,
                  border: new Border.all(width: 2.0, color: Colors.red),
                  borderRadius:
                  new BorderRadius.all(new Radius.circular(10.0)),
                  image: new DecorationImage(
                    image: new AssetImage(_list[index].url),
                    fit: BoxFit.fill,
                    //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
                    //  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  ),
                ),
                //alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      //  width: Adapt.px(60),
                      ///  height: Adapt.px(800),
                      alignment: Alignment.topLeft,
                      //  color: Colors.tealAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: Adapt.px(40),
                            //height: Adapt.px(250),
                            child: Text(
                              "\n\n\n\n\n ",
                              //   get_author[index],
                              style: TextStyle(
                                fontSize: Adapt.px(30),
                                color: Colors.black,
                                fontFamily: this.text_Family_Poem,
                              ),
                            ),
                          ),
                          Container(
                            //key:_key5,
                            width: Adapt.px(50),
                            height: Adapt.px(50),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(Adapt.px(10.0))),
                              image: new DecorationImage(
                                image: new AssetImage("lib/images/logo1.PNG"),
                                fit: BoxFit.fill,
                                //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
                                //  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                              ),
                            ),
                            child: null,
                          ),
                          Container(
                            width: Adapt.px(40),
                            //height: Adapt.px(250),
                            child: Text(
                              "\n${poems_part[index].author}",
                              //   get_author[index],
                              style: TextStyle(
                                fontSize: Adapt.px(30),
                                color: Colors.black,
                                fontFamily: this.text_Family_Poem,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: Adapt.px(50),
                      child: Text(
                        "\n${poems_part[index].text2}",
                        // ' ${get1[index*2+1]}',
                        style: TextStyle(
                          fontSize: Adapt.px(35),
                          color: Colors.black,
                          fontFamily: text_Family_Poem,
                        ),
                      ),
                    ),
                    Container(
                      width: Adapt.px(50),
                      alignment: Alignment.topCenter,
                      // color: Colors.lightGreen,
                      child: Text(
                        "${poems_part[index].text1}",
                        // '${get1[index*2]}',
                        style: TextStyle(
                            fontSize: Adapt.px(35),
                            color: Colors.black,
                            fontFamily: text_Family_Poem),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class VacationBean {
  String url;
  VacationBean(this.url);
  static List<VacationBean> generate() {
    return [
      //  for(int i=0;i<)
      VacationBean("lib/images/ground0.jpg"),
      VacationBean("lib/images/ground1.jpg"),
      VacationBean("lib/images/ground2.jpg"),
      VacationBean("lib/images/ground3.jpg"),
      VacationBean("lib/images/ground4.jpg"),
      VacationBean("lib/images/ground5.jpg"),
      VacationBean("lib/images/ground6.jpg"),
      VacationBean("lib/images/ground7.jpg"),
      VacationBean("lib/images/ground8.jpg"),
    ];
  }
}
