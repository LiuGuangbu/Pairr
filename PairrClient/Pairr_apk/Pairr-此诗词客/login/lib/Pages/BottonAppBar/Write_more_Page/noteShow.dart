import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';


class NoteShow extends StatefulWidget {
  final String title;
  final String content;

  NoteShow(this.title, this.content);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteShowState(title, content);
  }
}

class NoteShowState extends State<NoteShow> {
  final String title;
  final String content;
  List<String> content_final = null;
  int content_final_length = 0;
  File imagePart = global.get_photopath();

  NoteShowState(this.title, this.content);

  _content_add() async {
    //int i=0;
    //  int j=0;
//      String _add='\b';
//      String c;
    content_final = content.split("，"); //使用，分割，返回的是一个数组
    //int lenth=content.length;
//      print("content的长度是$lenth");
//     for(int i=0;i<lenth;){
//       int a =0;
//       a=content.indexOf('，',i);//提取分号下标
//         print("a=$a");
//        if(a<lenth){
//          String b= content.substring(i,a+1);//切割
//          print("b=$b");
//          content_final.add(b);
////          b = b + _add;//前面拼接
////          c =c + b;
////          print("c=$c");
//          i=a+2;//下一个开始标记；
//        }
//        else continue;
//
//
//      }
//      //content_final=c;
//      content_final_length= content_final.length;
//      print(content_final);
//
//
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    _content_add();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _content_add();
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            leading: new IconButton(
              icon: new Icon(
                Icons.arrow_back_ios,
                size: Adapt.px(35),
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Container(
              alignment: Alignment.center,
              child: Text(
                '随记',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Adapt.px(35),
                  color: Theme.of(context).accentColor,
                ),
              ),
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
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: ListTile(
                        title: Text('编辑'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        title: Text('字体'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        title: Text('横向展示'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        title: Text('竖直展示'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        title: Text('设置标签'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                        },
                      ),
                    )
                  ])
            ],
          ),
          preferredSize: Size.fromHeight(Adapt.px(90)),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 25,
                left: 25,
                right: 25,
                bottom: 25,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  // left: 50,
                  top: 50,
                  bottom: 50,
                ),
                decoration: new BoxDecoration(
                  color: Colors.grey,
                  border: new Border.all(width: 2.0, color: Colors.red),
                  borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                  image: new DecorationImage(
                    image: new AssetImage('lib/images/ground2.jpg'),
                    fit: BoxFit.fill,
                    //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
                    //  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                  ),
                ),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    new Container(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        strutStyle: StrutStyle(leading: 2), //行间距
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          //  fontFamily: this.text_poem,
                          fontWeight: FontWeight.bold, //字体粗细
                          fontSize: 25,
                          //fontStyle: FontStyle.italic,//倾斜,斜体,normal正常
                          // decoration: TextDecoration.underline,//修饰线（下划线、上划线、删除线）
                          // decoration: TextDecoration.underline, decorationColor: Colors.red) //decorationColor用来指定修饰线的颜色，
                        ),
                      ),
                    ),
                    for (int i = 0; i < content_final.length; i++)
                      new Container(
                        padding: EdgeInsets.only(top: Adapt.px(10)),
                        child: Text(
                          '${content_final[i]}${(i % 2 == 0) ? '，' : '。'}',
                          textAlign: TextAlign.center,
                          strutStyle: StrutStyle(leading: 2), //行间距
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              //  fontFamily: this.text_poem,
                              fontSize: 22),
                        ),
                      ),
                  ],
                ),
//竖向
//          child: Row(
//            children: <Widget>[
//              Container(
//                width: Adapt.px(60),
//                height: Adapt.px(550),
//                //  color: Colors.tealAccent,
//                child: Column(
//                  //     mainAxisAlignment: MainAxisAlignment.end,
//                  children: <Widget>[
//                    Container(
//                      width: Adapt.px(60),
//                      height: Adapt.px(450),
//                      // alignment: Alignment.topRight,
//                      child: CustomPaint(
//                        painter: VerticalText(
//                          text: title,
//                          textStyle: TextStyle(
//                            //  fontFamily: this.text_Family_Poem,
//                            // fontFamily: 'MaoZedong',
//                            color: Colors.black,
//                            fontSize: Adapt.px(30),
//                            letterSpacing: 4,
//                            // wordSpacing: 4
//                          ),
//                          width: Adapt.px(50),
//                          height: Adapt.px(400),
//                        ),
//                      ),
//                    ),
//                    Container(
//                      width: Adapt.px(50),
//                      height: Adapt.px(50),
//                      decoration: new BoxDecoration(
//                        borderRadius:
//                            new BorderRadius.all(new Radius.circular(10.0)),
//                        image: new DecorationImage(
//                          image: new AssetImage("lib/images/logo1.PNG"),
//                          fit: BoxFit.fill,
//                          //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
//                          //  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//                        ),
//                      ),
//                      child: null,
//                    ),
//                  ],
//                ),
//              ),
//              Container(
//                width: Adapt.px(50),
//                height: Adapt.px(600),
//                //color: Colors.blueAccent,
//                child: CustomPaint(
//                  painter: VerticalText(
//                    text: content,
//                    textStyle: TextStyle(
//                        //   fontFamily: this.text_Family_Poem,
//                        // fontFamily: 'MaoZedong',
//                        color: Colors.black,
//                        fontSize: Adapt.px(30),
//                        letterSpacing: 4,
//                        wordSpacing: 4),
//                    width: Adapt.px(50),
//                    height: Adapt.px(600),
//                  ),
//                ),
//              ),
//            ],
//          ),
              ),
            ),
          ],
        )
    );
  }
}
