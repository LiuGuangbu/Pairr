import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/Pages/BottonAppBar/PicturePage/photo_http.dart';
import 'package:login/Pages/BottonAppBar/SearchPage/listView_Poem.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';

class Show_Picture_and_Poem extends StatefulWidget {
  final List _list;
  Show_Picture_and_Poem(this._list);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShowPoem(_list);
  }
}

class _ShowPoem extends State<Show_Picture_and_Poem> {
  //List _list=[];
  var tabTitle = [
    '诗词',
    '译文',
    '注释',
    '赏析',
  ];

  var text_poem = '';
  var _listCount = 6;

  var text_Family = 'FontQidong';
  var text_Family_Poem;

  List content_final = [];
  final List _list;

  _ShowPoem(this._list); //= 'MaoZedong';
  void _toggleFavortie(String s) {
    setState(() {
      text_Family_Poem = s;
    });
  }

  //诗词的内容换行

//  _contentAdd(){
//    setState(() {
//      if (_list.length < 6)
//        _listCount = _list.length;
//      String _add='\b';
//      for(int j;j<_listCount;j++)
//        {
//         int  count=_list[j]['content'].Length();
//         print("content$j的长度等于$count");
//        // int t=0;
//          for(int i=0;i<count;i++)
//          {
//            int a =0;
//            a=_list[j]['content'].indexOf('，',i);//提取分号下标
//            print("a=$a");
//            if(a<count){
//              String b= _list[j]['content'].substring(i,a+1);//切割
//              print("b=$b");
//            //  content_final.add(b);
////          b = b + _add;//前面拼接
////          c =c + b;
////          print("c=$c");
//              i=a+2;//下一个开始标记；
//            }
//            else break;
//
//
//          }
//        }
//
//    });
//  }/
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);

  }

  @override
  Widget build(BuildContext context) {
    final appTitle = 'NestedScrollView';
    if (_list.length < 6) _listCount = _list.length;
    for(int i=0;i<_listCount;i++)
      _list[i]['content'].trim();//aab bcc 去除左右两边空格

//    _list[0]['content'].splitMapJoin("!",
//    onNonMatch:(String nonMatch){
//      return "。";
//    });
//    _list[0]['content'].replaceAll("！","。");
//    _list[0]['content'].replaceAll("!","。");
//    _list[0]['content'].replaceAll("?","。");
//    _list[0]['content'].replaceAll("?","。");
//    _list[0]['content'].replaceAll("；","。");
//    _list[0]['content'].replaceAll(";","。");

    content_final = _list[0]['content'].split("。");
    for(int i=0;i<content_final.length-1;i++){
      content_final[i]=content_final[i]+'。';
    }
    return Scaffold(
      body: new Container(
        color: Theme.of(context).primaryColor,
        child: new DefaultTabController(
          //选项卡数量
          length: tabTitle.length,
          child: new NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    child: new SliverAppBar(
                      automaticallyImplyLeading: false,
                      //设置没有返回按钮
                      //appbar标题
                      title: Row(
                        children: <Widget>[
                          //   Text('搜索结果'),
                          IconButton(
                            icon: new Icon(
                              Icons.arrow_back_ios,
                              size: Adapt.px(35),
                              color: Theme.of(context).accentColor,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          new Expanded(
                              child: Container(
                                child: null,
                              )),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              size: Adapt.px(35),
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.launch,
                              size: Adapt.px(35),
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
                              size: Adapt.px(35),
                              color: Theme.of(context).accentColor,
                            ),
                            //这是点击弹出菜单的操作，点击对应菜单后，改变屏幕中间文本状态，将点击的菜单值赋予屏幕中间文本
                            //这是弹出菜单的建立，包含了两个子项，分别是增加和删除以及他们对应的值
                            itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
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
                                                      fontSize:
                                                      Adapt.px(20),
                                                    ),
                                                  ),
                                                  trailing: RaisedButton(
                                                    color: Colors.white,
                                                    elevation: 0.0,
                                                    onPressed: () {
                                                      var _text = '';
                                                      _toggleFavortie(
                                                          _text);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_downward,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    var _text = '';
                                                    _toggleFavortie(_text);
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                ),
                                                ListTile(
                                                  subtitle: Text('毛泽东书法字体'),
                                                  title: Text(
                                                    '此诗词客给你诗意生活',
                                                    style: TextStyle(
                                                      fontFamily:
                                                      'MaoZedong',
                                                      fontSize:
                                                      Adapt.px(20),
                                                    ),
                                                  ),
                                                  trailing: RaisedButton(
                                                    color: Colors.white,
                                                    elevation: 0.0,
                                                    onPressed: () {
                                                      var _text =
                                                          'MaoZedong';
                                                      _toggleFavortie(
                                                          _text);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Icon(
                                                        Icons
                                                            .arrow_downward,
                                                        color:
                                                        Colors.black),
                                                  ),
//                                    onLongPress: (){
//                                      text_Family_Poem = 'MaoZedong';
//                                    },
                                                  onTap: () {
                                                    var _text = 'MaoZedong';
                                                    _toggleFavortie(_text);
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                ),
                                                ListTile(
                                                  subtitle:
                                                  Text('华文行楷简体字体'),
                                                  title: Text(
                                                    '此诗词客给你诗意生活',
                                                    style: TextStyle(
                                                      fontFamily:
                                                      'HuawenXingkai',
                                                      fontSize:
                                                      Adapt.px(30),
                                                    ),
                                                  ),
                                                  trailing: RaisedButton(
                                                    color: Colors.white,
                                                    elevation: 0.0,
                                                    onPressed: () {
                                                      var _text =
                                                          'HuawenXingkai';
                                                      _toggleFavortie(
                                                          _text);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_downward,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    var _text =
                                                        'HuawenXingkai';
                                                    _toggleFavortie(_text);
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                ),
                                                ListTile(
                                                  subtitle: Text('方正舒体简体'),
                                                  title: Text(
                                                    '此诗词客给你诗意生活',
                                                    style: TextStyle(
                                                      fontFamily:
                                                      'FangzhengShuti',
                                                      fontSize:
                                                      Adapt.px(30),
                                                    ),
                                                  ),
                                                  trailing: RaisedButton(
                                                    color: Colors.white,
                                                    elevation: 0.0,
                                                    onPressed: () {
                                                      var _text =
                                                          'FangzhengShuti';
                                                      _toggleFavortie(
                                                          _text);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_downward,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    var _text =
                                                        'FangzhengShuti';
                                                    _toggleFavortie(_text);
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new Text('字体切换'),
                                      new Icon(Icons.keyboard_arrow_right)
                                    ],
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                child: ListTile(
                                  title: Text('排版'),
                                  trailing:
                                  Icon(Icons.keyboard_arrow_right),
                                  onTap: () {},
                                ),
                              )
                            ])
                      ],
                      pinned: true,
                      //展开的最大高度
                      expandedHeight: 550.0,
                      flexibleSpace: FlexibleSpaceBar(
                        //背景,final Widget background;
                        //我们要使用的Image对象必须是const声明的常量对象,对象不可变
                        //_ImageView(path),
                        background: Image.file(
                          File(global.get_imagepath2()),
                          scale: 0.5,
                          fit: BoxFit.fill,
                        ),
                      ),
                      //强制appbar下面是否有阴影
                      forceElevated: false,
                      //显示在appbar下方,通常是TabBar,且小部件必须实现[PreferredSizeWidget]
                      //才能在bottom中使用!!!!
                      bottom: new TabBar(
                        indicatorColor: Theme.of(context).primaryColorLight,
                        //指示器颜色
                        labelColor: Theme.of(context).primaryColorLight,
                        labelStyle: TextStyle(fontSize: Adapt.px(30)),
                        unselectedLabelColor: Theme.of(context).accentColor,
                        unselectedLabelStyle: TextStyle(fontSize: Adapt.px(25)),

                        isScrollable: true,
                        //Tab选项卡小部件
                        tabs: tabTitle
                            .map((String name) => new Tab(text: name))
                            .toList(),
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(children: <Widget>[
                Container(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: Adapt.px(220)),
                          child: Column(
                            children: <Widget>[
                              new Container(
                                child: Text(
                                  //  global.getlistPoems()[0]['poemname'], //题目
                                  _list[0]['poemname'],
                                  strutStyle: StrutStyle(leading: 2), //行间距
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontFamily: this.text_poem,
                                    fontWeight: FontWeight.bold, //字体粗细
                                    fontSize: Adapt.px(32),
                                    //fontStyle: FontStyle.italic,//倾斜,斜体,normal正常
                                    // decoration: TextDecoration.underline,//修饰线（下划线、上划线、删除线）
                                    // decoration: TextDecoration.underline, decorationColor: Colors.red) //decorationColor用来指定修饰线的颜色，
                                  ),
                                ),
                              ),
                              new Container(
                                alignment: Alignment.center,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Container(
                                      child: Text(
                                        //   '[${global.getlistPoems()[0]['dynasty']}] ',
                                        _list[0]['dynasty'],
                                        strutStyle:
                                        StrutStyle(leading: 2), //行间距
                                        style: TextStyle(
                                            color:
                                            Theme.of(context).accentColor,
                                            fontFamily: this.text_poem,
                                            fontSize: Adapt.px(25)),
                                      ),
                                    ),
                                    new Container(
                                      child: Text(
                                        // global.getlistPoems()[0]['author'], //作者
                                        _list[0]['author'],
                                        strutStyle:
                                        StrutStyle(leading: 2), //行间距
                                        style: TextStyle(
                                            color:
                                            Theme.of(context).accentColor,
                                            fontFamily: this.text_poem,
                                            fontSize: Adapt.px(28)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // for (int i = 0; i < _listCount; i++)

                              //使用，分割，返回的是一个数组
                              for(int i=0;i<content_final.length;i++)
                                new Container(
                                  //正文的显示
                                  alignment: Alignment.center,
                                  width: 500.0,
                                  child: Container(
                                    child: Text(
                                      // global.getlistPoems()[0]['content'], //正文
                                      '${content_final[i]}' ,
                                      //_list[0]['content'],
                                      strutStyle: StrutStyle(leading: 2), //行间距
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor,
                                          fontFamily: this.text_poem,
                                          fontSize: Adapt.px(28)),
                                    ),
                                  ),
                                ),
                            ],
                          )),
                      Divider(
                        height: 10, //分隔符的高度（平均增加上下内边距，线不会变粗）
                        indent: 5, //前面缩进
                        color: Theme.of(context).dividerColor,
                      ),
                      new Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "猜你喜欢",
                                style: TextStyle(
                                  fontSize: Adapt.px(30),
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                            for (int i = 1; i < _list.length && i < 4; i++)
                              ListTile(
                                onTap: () {
                                  setState(() {
                                    var tt;
                                    tt = _list[i];
                                    _list[i] = _list[0];
                                    _list[0] = tt;
//                                    var tt_final;
//                                    tt_final = content_final[i];
//                                    content_final[i] = content_final[0];
//                                    content_final[0] = tt_final;
                                  });
                                },
                                title: Row(
                                  children: <Widget>[
                                    new Expanded(
                                      child: Text(
                                        _list[i]["poemname"],
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: Adapt.px(25),
                                            fontFamily: this.text_poem),
                                      ),
                                    ),
                                    Text(
                                      '[${_list[i]['dynasty']}] ',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: Adapt.px(25),
                                          fontFamily: this.text_poem),
                                    ),
                                    Text(
                                      _list[i]["author"],
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: Adapt.px(25),
                                          fontFamily: this.text_poem),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  _list[i]["content"],
                                  //content_final[i],
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: Adapt.px(23),
                                      fontFamily: this.text_poem,
                                      color: Theme.of(context).cardColor),
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(120),
                      child: Text(
                        global.getSearchTran(), //翻译
                        style: TextStyle(
                            fontSize: 25, fontFamily: 'HuawenXingkai'),
                      ),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(120),
                      child: Text(
                        global.getSearchNote(), //注释
                        style: TextStyle(
                            fontSize: 25, fontFamily: 'HuawenXingkai'),
                      ),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(120),
                      child: Text(
                        global.getSearchNote(), //赏析
                        style: TextStyle(
                            fontSize: 25, fontFamily: 'HuawenXingkai'),
                      ),
                    )
                  ],
                ),
              ])),
        ),
      ),
    );
  }
}
