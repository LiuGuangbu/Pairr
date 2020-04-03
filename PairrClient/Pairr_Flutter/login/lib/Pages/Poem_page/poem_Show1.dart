import 'package:flutter/material.dart';
import 'expandable_text.dart';
import 'add_Poem.dart';
import 'dart:math';

//第一个视图,列表
class PoemsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: Row(
              children: <Widget>[
                Text('搜索结果'),
                new Expanded(child: Container(child: null,)),
                IconButton(
                  onPressed: (){},
                  icon:
                  Icon(Icons.favorite_border,size: 35,color: Theme.of(context).accentColor ,),
                ),
                IconButton(
                  onPressed: (){},
                  icon:
                  Icon(Icons.launch,size: 35,color: Theme.of(context).accentColor ,),
                ),

              ],
            )


        ),
        body: Center(
          //创建一个商品列表
          child: PoemsColumn(Poems_list: poems_list,),
        ),
      ),
    );
  }
}

//创建商品竖向排列列表
class PoemsColumn extends StatelessWidget {
  int _selectedIndex = 1;
  //创建属性，用来接收外部数据。
  final List<PoemsDate> Poems_list; //创建一个元素是PoemsDate类的数组
  //初始化内置属性,继承内置的父类，初始化函数必须这样的形式
  PoemsColumn({Key key,@required this.Poems_list}):super(key:key);

  @override
  Widget build(BuildContext context) {
    //动态数据，使用ListView.builder()组件创建动态数据列表
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
//      decoration: BoxDecoration(
//        image: DecorationImage(
//          image: new NetworkImage(
//            // 'https://ss0.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=622084731,3469767921&fm=26&gp=0.jpg'
//              'http://image.biaobaiju.com/uploads/20181007/11/1538883626-BfVnwWKgDX.jpg'
//            //'http://pic141.nipic.com/file/20170918/21948267_135654045000_2.jpg'
//          ),
//          // image: AssetImage("image/1.jpg"),
//          fit: BoxFit.cover,
//        ),
//      ),
      child:Column(
        children: <Widget>[
          Container(
            // padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child:
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                // new Expanded(child:Container(child: null,)),
                Container(
                  //height: 50,
                  child: RaisedButton(
                    child: Text("文",style: TextStyle(fontFamily: 'FontJian',fontSize: 35),),
                    color: Colors.white,
                    // textColor: Colors.white,
                    splashColor: Colors.yellow,
                    shape: CircleBorder(
                        side: BorderSide(
                          style: BorderStyle.solid, width: 2,
                          color: Colors.red,
                        )),
                    onPressed: () {
                      print("圆型按钮");
                    },
                  ),
                ),
                Container(
                  //  height: 50,
                  child: RaisedButton(
                    child: Text("译",style: TextStyle(fontFamily: 'FontJian',fontSize: 35),),
                    color: Colors.white,
                    // textColor: Colors.white,
                    splashColor: Colors.yellow,
                    shape: CircleBorder(
                        side: BorderSide(
                          style: BorderStyle.solid, width: 2,
                          color: Colors.red,
                        )),
                    onPressed: () {
                      print("圆型按钮");
                    },
                  ),
                ),
                Container(
                  //height: 50,
                  child: RaisedButton(
                    child: Text("注",style: TextStyle(fontFamily: 'FontJian',fontSize: 35),),
                    color: Colors.white,
                    // textColor: Colors.white,
                    splashColor: Colors.yellow,
                    shape: CircleBorder(
                        side: BorderSide(
                          style: BorderStyle.solid, width: 2,
                          color: Colors.red,
                        )),
                    onPressed: () {
                      print("圆型按钮");
                    },
                  ),
                ),
                Container(
                  //height: 50,
                  child: RaisedButton(
                    child: Text("赏",style: TextStyle(fontFamily: 'FontJian',fontSize: 35),),
                    color: Colors.white,
                    // textColor: Colors.white,
                    splashColor: Colors.yellow,
                    shape: CircleBorder(
                        side: BorderSide(
                          style: BorderStyle.solid, width: 2,
                          color: Colors.red,
                        )),
                    onPressed: () {
                      print("圆型按钮");
                    },
                  ),
                ),
                Container(
                  // height: 50,
                  child: RaisedButton(
                    child: Text("作",style: TextStyle(fontFamily: 'FontJian',fontSize: 35),),
                    color: Colors.white,
                    // textColor: Colors.white,
                    splashColor: Colors.yellow,
                    shape: CircleBorder(
                        side: BorderSide(
                          style: BorderStyle.solid, width: 2,
                          color: Colors.red,
                        )),
                    onPressed: () {
                      print("圆型按钮");
                    },
                  ),
                ),

//                GestureDetector(
//                    child:Container(
//                      padding: EdgeInsets.all(5.0),
//                      decoration: ShapeDecoration(
//                        shape: CircleBorder(side:  BorderSide(color: Colors.red, style: BorderStyle.solid, width: 2)),
//                      ),
//                      child: Text('注',style: TextStyle(fontFamily: 'FontJian',fontSize: 35),),),
//
//                ),

              ],

            ),
          ),

          Divider(),
          new Expanded(child:
          PageView.builder(
              pageSnapping: true, //默认true，即拖动不到一半弹回原页面;flase即，拖到哪里停在哪
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
              itemCount:Poems_list.length ,
              //设置显示内容的相应，参数是匿名函数
              //itemBuilder: (context,index){},  //两个参数，一个是上下文，一个就是列表的索引
              itemBuilder: (context,index){
                //ListTile()组件，创建列表中的元素
                return
                  Column(
                    children: <Widget>[

                      new Expanded(child:
                      ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context,index_1){
                          return   Column(
                            children: <Widget>[
                              new Container(
                                child:Text(
                                  Poems_list[index].poem_title,
                                  strutStyle: StrutStyle(leading: 2),//行间距
                                  style: TextStyle(
                                    fontFamily: 'FontShou',
                                    fontWeight: FontWeight.bold,//字体粗细
                                    fontSize: 25,
                                    //fontStyle: FontStyle.italic,//倾斜,斜体,normal正常
                                    // decoration: TextDecoration.underline,//修饰线（下划线、上划线、删除线）
                                    // decoration: TextDecoration.underline, decorationColor: Colors.red) //decorationColor用来指定修饰线的颜色，

                                  ),
                                ),
                              ),new Container(
                                alignment: Alignment.center,
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Container(
                                      child:Text(
                                        Poems_list[index].poem_year,
                                        strutStyle: StrutStyle(leading: 2),//行间距
                                        style: TextStyle(
                                            fontFamily: 'FontShou',
                                            fontSize: 18
                                        ),
                                      ),
                                    ),
                                    new Container(
                                      child:Text(
                                        Poems_list[index].poem_author,
                                        strutStyle: StrutStyle(leading: 2),//行间距
                                        style: TextStyle(
                                            fontFamily: 'FontShou',
                                            fontSize: 18
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              new Container( //正文的显示
                                alignment: Alignment.center,
                                width: 500.0,
                                child:Container(
                                  child:Text(
                                    Poems_list[index].poem_text,

                                    strutStyle: StrutStyle(leading: 2),//行间距
                                    style: TextStyle(
                                        fontFamily: 'FontShou',
                                        fontSize: 22
                                    ),
                                  ),
                                ),),
                              new Container(

                                child: Column(
                                  children: <Widget>[
                                    new Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '翻译：',
                                        style:TextStyle(
                                          fontFamily: 'FontShou',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,//字体粗细
                                        ),

                                      ),
                                    ),
                                    new Container(
                                      child: ExpandableText(text: Poems_list[index].poem_tran, maxLines: 3, style: TextStyle(fontFamily: 'FontShou',fontSize: 18, color: Colors.black),),
                                    ),
                                  ],
                                ),
                              ),
                              new Container(

                                child: Column(
                                  children: <Widget>[
                                    new Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '注释：',
                                        style:TextStyle(
                                          fontFamily: 'FontShou',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,//字体粗细
                                        ),

                                      ),
                                    ),
                                    new Container(
                                      child: ExpandableText(text: Poems_list[index].poem_note, maxLines: 3, style: TextStyle(fontFamily: 'FontShou',fontSize: 18, color: Colors.black),),

                                    ),
                                  ],
                                ),
                              ),

                            ],
                          );
                        },
                      )
                      ),
                    ],
                  );

              })
          ),
          new Divider(),
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child:
              Row(children: <Widget>[
                Expanded(child: TextField(
                  decoration: InputDecoration(
                    labelText: '点击评论...',
                    labelStyle: TextStyle(
                      color: Colors.pink,
                      fontSize: 15,
                    ),
                    //helperText: 'helperText',
                    hintText: 'Placeholder...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),),
                new Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 20),
                  child: IconButton(
                    icon: Icon(Icons.send,size: 45,),
                    onPressed: (){

                    },
                  ),
                )

              ],

              )

          ),
        ],
      ),
    );
  }
}



