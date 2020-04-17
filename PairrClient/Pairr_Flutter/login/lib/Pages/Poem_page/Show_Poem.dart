import 'package:flutter/material.dart';
import 'package:login/scoped_models/main.dart';

class ShowPoem extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShowPoem();
  }
}
class _ShowPoem extends State<ShowPoem>{
  var tabTitle = [
    '诗词',
    '译文',
    '注释',
    '赏析',
    '作者',
  ];

  var text_poem= 'HuawenXingkai';

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);

  }
  @override
  Widget build(BuildContext context) {
    final appTitle = 'NestedScrollView';
    return Scaffold(
        body: new Center(
          child: new DefaultTabController(
            //选项卡数量
            length: tabTitle.length,
            child: new NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    child: new SliverAppBar(
                      automaticallyImplyLeading: false, //设置没有返回按钮
                      //appbar标题
                      title:new IconButton(
                        icon: new Icon(Icons.arrow_back_ios, color: Theme.of(context).accentColor ,),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      //const Text('NestedScrollView'),
                      //列表在滚动的时候appbar是否一直保持可见
                      pinned: true,
                      //展开的最大高度
                      expandedHeight: 300.0,
                      flexibleSpace: const FlexibleSpaceBar(
                        //背景,final Widget background;
                        //我们要使用的Image对象必须是const声明的常量对象,对象不可变
                        background: const Image(
                          colorBlendMode: BlendMode.multiply,
                        //  color:Colors.black38,
                          image: const AssetImage("lib/images/login4.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),

                      //强制appbar下面有阴影
                      forceElevated: true,

                      //显示在appbar下方,通常是TabBar,且小部件必须实现[PreferredSizeWidget]
                      //才能在bottom中使用!!!!
                      bottom: new TabBar(
                        isScrollable:true,
                        //Tab选项卡小部件
                        tabs: tabTitle.map((String name) => new Tab(text: name)).toList(),
                      ),
                    ),
                  ),
                ];
              },

                body: TabBarView(children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(120),
                          child: Column(children: <Widget>[
                            new Container(
                              child:Text(
                                global.getSearchName(),//题目
                                strutStyle: StrutStyle(leading: 2),//行间距
                                style: TextStyle(
                                  fontFamily: this.text_poem,
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
                                      global.getSearchYear(),//年代
                                      strutStyle: StrutStyle(leading: 2),//行间距
                                      style: TextStyle(
                                          fontFamily: this.text_poem,
                                          fontSize: 18
                                      ),
                                    ),
                                  ),
                                  new Container(
                                    child:Text(
                                      global.getSearchAuthor(),//作者
                                      strutStyle: StrutStyle(leading: 2),//行间距
                                      style: TextStyle(
                                          fontFamily: this.text_poem,
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
                                  global.getSearchContent(),//正文

                                  strutStyle: StrutStyle(leading: 2),//行间距
                                  style: TextStyle(
                                      fontFamily: this.text_poem,
                                      fontSize: 22
                                  ),
                                ),
                              ),),
                          ],)
                      )
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(120),
                        child: Text(global.getSearchTran(),//翻译
                          style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
                      )
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(120),
                        child: Text(global.getSearchNote(),//注释
                          style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
                      )
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(120),
                        child: Text(global.getSearchNote(),//赏析
                          style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
                      )
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(120),
                        child: Text(global.getSearchNote(),//作者
                          style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
                      )
                    ],
                  ),
                ])
            ),
          ),
        ),
      );
  }

}
class MyApp extends StatelessWidget {

  final List<String> _tabs = <String>[
    'Tab1', 'Tab2', 'Tab3', 'Tab4', 'Tab5', 'Tab6', 'Tab7',
  ];

  @override
  Widget build(BuildContext context) {
    final appTitle = 'NestedScrollView';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: new Center(
          child: new DefaultTabController(
            //选项卡数量
            length: _tabs.length,
            child: new NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    child: new SliverAppBar(
                      //appbar标题
                      title: const Text('NestedScrollView'),
                      //列表在滚动的时候appbar是否一直保持可见
                      pinned: true,
                      //展开的最大高度
                      expandedHeight: 150.0,
                      flexibleSpace: const FlexibleSpaceBar(
                        //背景,final Widget background;
                        //我们要使用的Image对象必须是const声明的常量对象,对象不可变
                        background: const Image(
                          colorBlendMode: BlendMode.multiply,
                          color:Colors.black38,
                          image: const AssetImage("images/lake.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),

                      //强制appbar下面有阴影
                      forceElevated: true,

                      //显示在appbar下方,通常是TabBar,且小部件必须实现[PreferredSizeWidget]
                      //才能在bottom中使用!!!!
                      bottom: new TabBar(
                        isScrollable:true,
                        //Tab选项卡小部件
                        tabs: _tabs.map((String name) => new Tab(text: name)).toList(),
                      ),
                    ),
                  ),
                ];
              },

              body: new TabBarView(
                ///下面是选项卡视图的内容列表,自己任意发挥即可
                children: _tabs.map((String name) {
                  return new SafeArea(
                    top: false,
                    bottom: false,
                    child: new Builder(
                      ///这个Builder需要提供一个BuildContext，
                      ///它“在”NestedScrollView中，
                      ///以便SliverOverlapAbsorberHandleFor()可以找到NestedScrollView。
                      builder: (BuildContext context) {
                        return new CustomScrollView(
                          ///”controller”和“primary”不设置，以便NestedScrollView可以控制该内部滚动视图。
                          ///如果设置了“controller”属性，则此滚动视图将不会与NestedScrollView相关联。
                          ///PageStorageKey应为此ScrollView所独有；
                          ///它允许列表在选项卡视图不在屏幕上时记住其滚动位置。
                          key: new PageStorageKey<String>(name),
                          slivers: <Widget>[
                            new SliverOverlapInjector(
                              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                            ),
                            new SliverPadding(
                              padding: const EdgeInsets.all(8.0),
                              //创建一个有固定item的列表
                              sliver: new SliverFixedExtentList(
                                //item高度48像素
                                itemExtent: 48.0,
                                delegate: new SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                    return new ListTile(
                                      title: new Text('Item $index'),
                                    );
                                  },
                                  childCount: 30,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}