import 'package:flutter/material.dart';

import 'add_Poem.dart';

const url =
    'http://www.pptbz.com/pptpic/UploadFiles_6909/201203/2012031220134655.jpg';

class TestPage extends StatelessWidget {
  var tabTitle = [
    '诗词',
    '译文',
    '注释',
    '赏析',
    '作者',
  ];
  final List<PoemsDate> Poems_list;
  final List poems_list_view;
  var text_poem= 'HuawenXingkai';
  TestPage(PoemsDate poems_list, {Key key,this.Poems_list, this.poems_list_view}):super(key :key);
  //_TestPageState({Key key,@required this.Poems_list}):super(key:key);//创建一个元素是PoemsDate类的数组
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabTitle.length,
        child: Scaffold(
          appBar: AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Theme.of(context).accentColor ,),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: new NestedScrollView(
            headerSliverBuilder: (context, bool) {
              return [
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
//                      title: Text(
//                        "我是可以跟着滑动的title",
//                      ),
                      background: Image.network(
                        url,
                        fit: BoxFit.cover,
                      )),
                ),
                new SliverPersistentHeader(
                  delegate: new SliverTabBarDelegate(
                    new TabBar(
                      tabs: tabTitle.map((f) => Tab(text: f)).toList(),
                      indicatorColor: Colors.red,
                      isScrollable: false,
                      //是否可以滚动
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: TextStyle(fontSize: 20.0),
                      unselectedLabelStyle: TextStyle(fontSize: 18 ),
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.red,
                    ),
                    color: Colors.white,
                  ),
                 pinned: true,
                ),
              ];
            },
            body: TabBarView(children: <Widget>[
                ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Column(children: <Widget>[
                        new Container(
                          child:Text(
                           poems_list_view[1],
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
                                  poems_list_view[2],
                                  strutStyle: StrutStyle(leading: 2),//行间距
                                  style: TextStyle(
                                      fontFamily: this.text_poem,
                                      fontSize: 18
                                  ),
                                ),
                              ),
                              new Container(
                                child:Text(
                                  poems_list_view[3],
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
                             poems_list_view[4],

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
                      padding: EdgeInsets.all(40),
                      child: Text(poems_list_view[5],style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Text(poems_list_view[6].poem_text,style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(40),
                      child: Text(poems_list_view[5],style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(50),
                      child: Text(poems_list_view[5],style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
                    )
                  ],
                ),
            ])
//            PageView.builder(
//              pageSnapping: true,
//                scrollDirection: Axis.horizontal,//垂直切换
//                reverse: false,
//                onPageChanged: (currentIndex)=>
//                debugPrint('诗词展示的切换到页面：$currentIndex'),
//                controller: PageController(
//                  initialPage: 0,
//                  keepPage: false,
//                  viewportFraction: 1,
//                ),
//                itemCount: 10,
//                itemBuilder: (context, index){
//              return TabBarView(children: <Widget>[
//                ListView(
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.all(40),
//                      child: Column(children: <Widget>[
//                        new Container(
//                          child:Text(
//                            Poems_list[index].poem_title,
//                            strutStyle: StrutStyle(leading: 2),//行间距
//                            style: TextStyle(
//                              fontFamily: this.text_poem,
//                              fontWeight: FontWeight.bold,//字体粗细
//                              fontSize: 25,
//                              //fontStyle: FontStyle.italic,//倾斜,斜体,normal正常
//                              // decoration: TextDecoration.underline,//修饰线（下划线、上划线、删除线）
//                              // decoration: TextDecoration.underline, decorationColor: Colors.red) //decorationColor用来指定修饰线的颜色，
//
//                            ),
//                          ),
//                        ),new Container(
//                          alignment: Alignment.center,
//                          child: new Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              new Container(
//                                child:Text(
//                                  Poems_list[index].poem_year,
//                                  strutStyle: StrutStyle(leading: 2),//行间距
//                                  style: TextStyle(
//                                      fontFamily: this.text_poem,
//                                      fontSize: 18
//                                  ),
//                                ),
//                              ),
//                              new Container(
//                                child:Text(
//                                  Poems_list[index].poem_author,
//                                  strutStyle: StrutStyle(leading: 2),//行间距
//                                  style: TextStyle(
//                                      fontFamily: this.text_poem,
//                                      fontSize: 18
//                                  ),
//                                ),
//                              ),
//
//                            ],
//                          ),
//                        ),
//                        new Container( //正文的显示
//                          alignment: Alignment.center,
//                          width: 500.0,
//                          child:Container(
//                            child:Text(
//                              Poems_list[index].poem_text,
//
//                              strutStyle: StrutStyle(leading: 2),//行间距
//                              style: TextStyle(
//                                  fontFamily: this.text_poem,
//                                  fontSize: 22
//                              ),
//                            ),
//                          ),),
//                      ],)
//                    )
//                  ],
//                ),
//                ListView(
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.all(40),
//                      child: Text(poems_list[index].poem_tran,style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
//                    )
//                  ],
//                ),
//                ListView(
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.all(40),
//                      child: Text(poems_list[index].poem_text,style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
//                    )
//                  ],
//                ),
//                ListView(
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.all(40),
//                      child: Text(poems_list[index].poem_tran,style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
//                    )
//                  ],
//                ),
//                ListView(
//                  children: <Widget>[
//                    Container(
//                      padding: EdgeInsets.all(50),
//                      child: Text(poems_list[index].poem_note,style: TextStyle(fontSize: 25,fontFamily: 'HuawenXingkai'),),
//                    )
//                  ],
//                ),
//              ]);
//            })
//            TabBarView(
//              children: tabTitle
//                  .map((s) => ListView.builder(
//                itemBuilder: (context, int) => Text("123"),
//                itemCount: 50,
//              ))
//                  .toList(),
//            ),
          ),
        ));
  }

}

class SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar widget;
  final Color color;

  const SliverTabBarDelegate(this.widget, {this.color})
      : assert(widget != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: widget,
      color: color,
    );
  }

  @override
  bool shouldRebuild(SliverTabBarDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => widget.preferredSize.height;

  @override
  double get minExtent => widget.preferredSize.height;
}

