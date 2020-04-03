import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login/Pages/Poem_page/add_Poem.dart';
import 'package:login/scoped_models/vertical_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarDemoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppBarDemoPageState();
  }

}
class _AppBarDemoPageState extends State<AppBarDemoPage> {
  //const AppBarDemoPage({Key key}) : super(key: key);

  var text_Family = 'FontQidong';
  var text_Family_Poem ;//= 'MaoZedong';
  void _toggleFavortie(String s){
    setState(() {
      text_Family_Poem=s;
    });

  }

  double text_Size = 17.0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:2 ,
      child: Scaffold(
        appBar: AppBar(
          //title:Text("AppBarDemoPage"),
          // backgroundColor: Colors.red,
          //centerTitle:true,

          title: Row(
            children: <Widget>[
              new Expanded(
                  child:  TabBar(
                    indicatorColor: Theme.of(context).primaryColorLight,//底部指示器的颜色
                    indicatorSize: TabBarIndicatorSize.label,//指示器大小计算方式
                    labelColor: Theme.of(context).primaryColorLight,//选中颜色
                    unselectedLabelColor: Theme.of(context).accentColor,//未选中颜色
                    labelStyle: TextStyle(fontFamily: text_Family,fontSize: text_Size+3.0),//选中样式
                    unselectedLabelStyle: TextStyle(fontFamily: text_Family,fontSize: text_Size ),
                    tabs: <Widget>[
                      Tab(text: "孟诗韩笔",) ,
                      Tab(text: "飞花令")
                    ],
                  ),
              ),

              IconButton(
                onPressed: (){},
                icon:
                Icon(Icons.favorite_border,size: 35,
                  color: Theme.of(context).accentColor ,
                ),
              ),
              IconButton(
                onPressed: (){},
                icon:
                Icon(Icons.launch,size: 35,
                  color: Theme.of(context).accentColor ,
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
              //这是点击弹出菜单的操作，点击对应菜单后，改变屏幕中间文本状态，将点击的菜单值赋予屏幕中间文本
                //这是弹出菜单的建立，包含了两个子项，分别是增加和删除以及他们对应的值
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet<void>(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          builder: (BuildContext context){
                            return Container(
                              child: ListView(
                                children: <Widget>[
                                  ListTile(
                                    subtitle: Text('系统字体'),
                                    title:Text('品味中国文化之美',style: TextStyle(fontSize: this.text_Size,),) ,
                                   trailing: RaisedButton(
                                    onPressed: (){
                                      var _text='';
                                      _toggleFavortie(_text);
                                      Navigator.of(context).pop();
                                    },
                                     child: Icon(Icons.arrow_downward),
                                   ),
                                    onTap: (){
                                      var _text='';
                                      _toggleFavortie(_text);
                                      Navigator.of(context).pop();

                                    },
                                  ),
                                  ListTile(
                                    subtitle: Text('毛泽东书法字体'),
                                    title:Text('品味中国文化之美',style: TextStyle(fontFamily:'MaoZedong',fontSize: this.text_Size,),) ,
                                    trailing: RaisedButton(
                                      onPressed:(){
                                        var _text='MaoZedong';
                                        _toggleFavortie(_text);
                                       Navigator.of(context).pop();
                                      },
                                      child: Icon(Icons.arrow_downward),
                                    ),
//                                    onLongPress: (){
//                                      text_Family_Poem = 'MaoZedong';
//                                    },
                                  onTap: (){
                                    var _text='MaoZedong';
                                    _toggleFavortie(_text);
                                    Navigator.of(context).pop();
                                  },

                                  ),
                                  ListTile(
                                    subtitle: Text('华文行楷简体字体'),
                                    title:Text('品味中国文化之美',style: TextStyle(fontFamily:'HuawenXingkai',fontSize: this.text_Size,),) ,
                                    trailing: RaisedButton(
                                      onPressed: (){
                                        var _text='HuawenXingkai';
                                        _toggleFavortie(_text);
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(Icons.arrow_downward),
                                    ),
                                    onTap: (){
                                      var _text='HuawenXingkai';
                                      _toggleFavortie(_text);
                                      Navigator.of(context).pop();

                                    },
                                  ),
                                  ListTile(
                                    subtitle: Text('方正舒体简体'),
                                    title:Text('品味中国文化之美',style: TextStyle(fontFamily:'FangzhengShuti',fontSize: this.text_Size,),) ,
                                    trailing: RaisedButton(
                                      onPressed: (){
                                        var _text='FangzhengShuti';
                                        _toggleFavortie(_text);
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(Icons.arrow_downward),
                                    ),
                                    onTap: (){
                                      var _text='FangzhengShuti';
                                      _toggleFavortie(_text);
                                      Navigator.of(context).pop();

                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        );

                      },
                     child: new Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap:(){},
                    ),
//                    child: new Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: <Widget>[
//                        new Text('增加'),
//                        new Icon(Icons.remove_circle)
//                      ],
//                    ),
                  )
                ])
          ],



        ),
        body: TabBarView(
          children: <Widget>[
            home_Page(text_Family_Poem:text_Family_Poem ),
            ListView(
              children: <Widget>[

                ListTile(
                    title:Text("第二个tab")
                ),
                ListTile(
                    title:Text("第二个tab")
                ),
                ListTile(
                    title:Text("第二个tab")
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class home_Page extends StatelessWidget{
  //var ImageURL='lib/images/ritui.jpg';
  var text_Family_Poem;
  home_Page({Key key,this.text_Family_Poem}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('日推诗词'),),
      body:PageView.builder(
          pageSnapping: true,
          scrollDirection:
          Axis.horizontal, //垂直切换还是水平切换（默认水平，Android原生ViewPage要费很大劲才能实现）
          reverse: false, //倒置，设置true页面顺序从后往前，默认false
          onPageChanged: (currentIndex) =>
              debugPrint('当前页面：$currentIndex'), //onPageChanged 监听页面改变，输出当前页面序号
          controller: PageController(
              initialPage: 0, //默认显示第几个页面（默认0）
              keepPage: false, //设置为true  initialPage才生效（默认true）
              viewportFraction: 1.0 //默认1，每个页面占可视窗的比例
          ),
          //设置显示个数
          itemCount:10 ,
          //设置显示内容的相应，参数是匿名函数
          itemBuilder: (context, index) {
            return Container(
                padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
                //decoration: BoxDecoration(color: Theme.of(context).accentColor,),
                child:Card(
                    margin: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Container(
//                        decoration: BoxDecoration(
//                            color: Colors.red,
//                            image: DecorationImage(
//                            //  image: AssetImage(this.ImageURL),
//                             // fit: BoxFit.fill,
//                            )
//                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                             color: Colors.black12,
                              width: 100,
                              height: 600,
                              child: CustomPaint(
                                painter: VerticalText(
                                  text: "你好，这是垂直排版的文字，排版顺序从上到下，从右到左。😊😂😄",
                                  textStyle: TextStyle(
                                      fontFamily: this.text_Family_Poem,
                                      // fontFamily: 'MaoZedong',
                                      color: Colors.black,
                                      fontSize: 30,
                                      letterSpacing: 4,
                                      wordSpacing: 4),
                                  width: 100,
                                  height: 500,
                                ),
                              ),
                            ),
                            Container(
                             // color: Colors.black12,
                              width: 100,
                              height: 600,
                              child: CustomPaint(
                                painter: VerticalText(
                                  text: poems_list[index].poem_text,
                                  textStyle: TextStyle(
                                      fontFamily: this.text_Family_Poem,
                                      // fontFamily: 'MaoZedong',
                                      color: Colors.black,
                                      fontSize: 30,
                                      letterSpacing: 4,
                                      wordSpacing: 4),
                                  width: 100,
                                  height: 500,
                                ),
                              ),
                            ),
                            Container(
                            //  color: Colors.black12,
                              width: 100,
                              height: 600,
                              child: CustomPaint(
                                painter: VerticalText(
                                  text: poems_list[index].poem_title,
                                  textStyle: TextStyle(
                                      fontFamily: this.text_Family_Poem,
                                      // fontFamily: 'MaoZedong',
                                      color: Colors.black,
                                      fontSize: 30,
                                      letterSpacing: 4,
                                      wordSpacing: 4),
                                  width: 100,
                                  height: 600,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    )

                )

            );
          }
      ),
    );
  }
}
