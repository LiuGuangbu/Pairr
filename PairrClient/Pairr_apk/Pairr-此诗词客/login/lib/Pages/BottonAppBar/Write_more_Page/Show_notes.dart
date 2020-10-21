// import 'dart:core' as prefix0;
// import 'dart:core';
// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:login/Pages/BottonAppBar/SearchPage/listView_Poem.dart';
// import 'package:login/Utils/Adapt.dart';
// import 'package:login/scoped_models/main.dart';
//
// class NoteShow extends StatefulWidget {
//   final String title;
//   final String content;
//
//   NoteShow(this.title, this.content);
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return NoteShowState(title, content);
//   }
// }
//
// class NoteShowState extends State<NoteShow> {
//   final String title;
//   final String content;
//
//   NoteShowState(this.title, this.content);
//
//   List<String> content_final = null;
//   int content_final_length = 0;
//   File imagePart = global.get_photopath();
//
//   _content_add() async {
//     content_final = content.split("，"); //使用，分割，返回的是一个数组
//   }
//
//   @override
//   void setState(fn) {
//     // TODO: implement setState
//     super.setState(fn);
//     _content_add();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: new Container(
//       color: Theme.of(context).primaryColor,
//       child: new DefaultTabController(
//         child: new NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return <Widget>[
//               new SliverOverlapAbsorber(
//                 handle:
//                     NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                 child: new SliverAppBar(
//                   automaticallyImplyLeading: false,
//                   //设置没有返回按钮
//                   //appbar标题
//                   title: Row(
//                     children: <Widget>[
//                       //   Text('搜索结果'),
//                       IconButton(
//                         icon: new Icon(
//                           Icons.arrow_back_ios,
//                           size: Adapt.px(35),
//                           color: Theme.of(context).accentColor,
//                         ),
//                         onPressed: () => Navigator.of(context).pop(),
//                       ),
//                       new Expanded(
//                           child: Container(
//                         child: null,
//                       )),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.favorite_border,
//                           size: Adapt.px(35),
//                           color: Theme.of(context).accentColor,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: Icon(
//                           Icons.launch,
//                           size: Adapt.px(35),
//                           color: Theme.of(context).accentColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   actions: <Widget>[
//                     /*
//           下面是一个弹出菜单按钮，包含两个属性点击属性和弹出菜单子项的建立
//           其中<String>是表示这个弹出菜单的value内容是String类型
//            */
//                   ],
//                   pinned: true,
//                   //展开的最大高度
//                   expandedHeight: Adapt.px(380),
//                   flexibleSpace: const FlexibleSpaceBar(
//                     //背景,final Widget background;
//                     //我们要使用的Image对象必须是const声明的常量对象,对象不可变
//                     background: const Image(
//                       colorBlendMode: BlendMode.multiply,
//                       //  color:Colors.black38,
//                       image: const AssetImage("lib/images/login4.jpg"),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//
//                   //强制appbar下面是否有阴影
//                   forceElevated: true,
//                 ),
//               ),
//             ];
//           },
//           body: Container(
//             padding: EdgeInsets.only(
//               top: Adapt.px(35),
//               left: Adapt.px(35),
//               right: Adapt.px(35),
//               bottom: Adapt.px(35),
//             ),
//             child: Container(
//               padding: EdgeInsets.only(
//                 // left: 50,
//                 top: Adapt.px(50),
//                 bottom: Adapt.px(50),
//               ),
//               decoration: new BoxDecoration(
//                 color: Colors.grey,
//                 border: new Border.all(width: 2.0, color: Colors.red),
//                 borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
//                 image: new DecorationImage(
//                   image: new AssetImage('lib/images/ground2.jpg'),
//                   fit: BoxFit.fill,
//                   //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
//                   //  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//                 ),
//               ),
//               alignment: Alignment.center,
//               child: Column(
//                 children: <Widget>[
//                   new Container(
//                     child: Text(
//                       title,
//                       textAlign: TextAlign.center,
//                       strutStyle: StrutStyle(leading: 2), //行间距
//                       style: TextStyle(
//                           color: Theme.of(context).accentColor,
//                           //  fontFamily: this.text_poem,
//                           fontWeight: FontWeight.bold, //字体粗细
//                           fontSize: Adapt.px(28)
//                           //fontStyle: FontStyle.italic,//倾斜,斜体,normal正常
//                           // decoration: TextDecoration.underline,//修饰线（下划线、上划线、删除线）
//                           // decoration: TextDecoration.underline, decorationColor: Colors.red) //decorationColor用来指定修饰线的颜色，
//                           ),
//                     ),
//                   ),
//                   for (int i = 0; i < content_final.length; i++)
//                     new Container(
//                       padding: EdgeInsets.only(top: Adapt.px(10)),
//                       child: Text(
//                         '${content_final[i]}${(i % 2 == 0) ? '，' : '。'}',
//                         textAlign: TextAlign.center,
//                         strutStyle: StrutStyle(leading: 2), //行间距
//                         style: TextStyle(
//                             color: Theme.of(context).accentColor,
//                             //  fontFamily: this.text_poem,
//                             fontSize: Adapt.px(24)),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
