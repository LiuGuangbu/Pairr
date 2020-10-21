import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:login/Pages/BottonAppBar/SearchPage/listView_Poem.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  var _isShowClear =true;
  List _listSearch = []; //搜索历史数值
  final String mListSearch='listSearch';
  int _listSearch_Length = 0;
  List<Object> list =[];

  //搜索推荐
  List list_Recommend = ['梅花', '繁花似锦', '中秋节', '爱情诗', '爱我中华','惆怅',  '陶渊明', '月'];

  void _searchClear(String s) {
    //删除搜索历史某个数值，更新
    setState(() {
      _listSearch.remove(s);
    });
  }

  void _isChipRecommend() {
    setState(() {});
  }
  var _showV=global.get_searchShow();

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
    });
    super.initState();
    // _getHotsearch();
    _saveShow();
    _getShow();
//
//    if(_showV == 0)
//      {
//        Future.delayed(Duration(milliseconds: 5),(){
//          show1();
//        });
//        global.set_searchShow(1);
//
//      }

  }
// Future _getHotsearch()async{
//    print('热搜框开始请求了！！！');
//    var apiUrl = global.get_apiUrlhot_serach();
//    var response = await http.post(apiUrl,body: null);
//    if (response.statusCode == 200) {
//      //  print(convert.jsonDecode(response.body));
//      setState(() {
//        var data = convert.jsonDecode(response.body);
//        list_Recommend = data;
//        print('得到热搜是：${list_Recommend}');
//      });
//    } else {
//      setState(() {
//        print('热搜获取失败: ${response.statusCode}');
//        list_Recommend =[];
//      });
//
//    }
//    print('请求结束了！！！');
//  }
  _saveShow () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('SHOW', _showV);
  }
  _getShow() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // userName = prefs.getInt('SHOW').toInt();

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

    return new Builder(builder: (BuildContext context){
      return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            elevation: 0.0,//appbar的下划线阴影部分。
            title:  Container(

              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.only(
                  top: Adapt.px(10),
                  // top: MediaQueryData.fromWindow(window).padding.top,
                ),
                child: new Container(
                  //padding: EdgeInsets.only(left: Adapt.px(0),right: Adapt.px(0),bottom: Adapt.px(10),),
                  // padding: const EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 30),
                  child: new Container(

                    decoration: new BoxDecoration(
                      color: Theme.of(context).dialogBackgroundColor,
                      //border: new Border.all(width: 2.0, color: Colors.red),
                      borderRadius:
                      new BorderRadius.all(new Radius.circular(15.0)),
                    ),
                    //  padding: EdgeInsets.only(right: 10,),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        //SizedBox(width: 5.0,),
                        new IconButton(
                          icon: new Icon(Icons.search),
                          color: Theme.of(context).accentColor,
                          iconSize: Adapt.px(40),
                          onPressed: () {},
                        ),
                        // Icon(Icons.search, size:30,color: Colors.grey,),
                        Expanded(
                            child: Container(
                              // padding: EdgeInsets.only(top: 5.0),
                              // margin: EdgeInsets.only(top: Adapt.px(1)),
                              alignment: Alignment.center,
                              child: TextField(
                                maxLines: 1,
                                key:_key1,
                                textAlign: TextAlign.left,
                                controller: _searchController,
                                //  focusNode: _focusNodeSearch,
                                style: TextStyle(
                                  fontSize: Adapt.px(28),
                                  color: Theme.of(context).accentColor,
                                  //fontFamily: 'FontJian'
                                ),
                                decoration: new InputDecoration(
                                  // contentPadding: EdgeInsets.only(top: 1.0),
                                  hintText: '请输入...',
                                  //focusColor: Colors.white,
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).cardColor,
                                  ),
                                  border: InputBorder.none,//下划线设置

                                ),
                              ),
                            )),
//                              new Text(
//                                "|",
//                                style: TextStyle(
//                                    color: Theme.of(context).accentColor,
//                                    fontSize: Adapt.px(30)),
//                              ),
                        new Container(
                          child: IconButton(
                              key: _key2,
                              iconSize: Adapt.px(40),
                              color: Theme.of(context).accentColor,
                              icon: Icon((_isShowClear)
                                  ? Icons.cancel
                                  : Icons.keyboard_voice),
                              onPressed: () {
                                _searchController.clear();
                              }),
                        ),
                        new Container(
                          padding: EdgeInsets.only(right: Adapt.px(8),top:Adapt.px(8),bottom: Adapt.px(8), ),
                          child:ButtonTheme(
                            minWidth: Adapt.px(10),
                            child: RaisedButton(
                              color: Theme.of(context).cardColor,


                              onPressed: (){
                                _focusNodeSearch.unfocus();
                                print(_searchController);
                                searpart = _searchController.text;
                                if (searpart != "") {

                                  _listSearch.add(searpart);
                                  //save();
                                  //  getStringList(mListSearch);
//                                                Scaffold.of(context).showSnackBar(
//                                                    new SnackBar(content:  Text("数据存储成功")));
                                  global.setSearchV(searpart);
                                  print('搜索内容是：${global.getSearchV()}');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => httpPage()));
                                }; //后期判断搜索内容是否为空
                              },
                              shape: StadiumBorder(),
                              //disabledColor: Theme.of(context).accentColor,
                              child: Container(
                                // padding: EdgeInsets.all(5),
                                child: Text(
                                  "搜索",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColorLight,
                                      fontSize: Adapt.px(28)),
                                ),
                              ),
                            ),
                          ),

                        )

//
                      ],
                    ),
                  ),

                ),
              ),
            ),
          ),
         preferredSize: Size.fromHeight(Adapt.px(90)),//appBar高度
        ), 
          body: GestureDetector(
            onTap: () {
              global.setlistPoems(null);
              print('点击了空白区域');
              _focusNodeSearch.unfocus();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: ListView(
                children: <Widget>[
//                  Container(
//                    color: Theme.of(context).primaryColor,
//                    child: Padding(
//                      padding: EdgeInsets.only(
//                        top: Adapt.px(10),
//                        // top: MediaQueryData.fromWindow(window).padding.top,
//                      ),
//                      child: new Container(
//                        padding: EdgeInsets.only(left: Adapt.px(10),right: Adapt.px(10),bottom: Adapt.px(10),),
//                        // padding: const EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 30),
//                        child: Row(
//                          children: <Widget>[
//                            new Expanded(
//                              child: new Container(
//                                  child: new Container(
//
//                                    decoration: new BoxDecoration(
//                                      color: Theme.of(context).dialogBackgroundColor,
//                                      //border: new Border.all(width: 2.0, color: Colors.red),
//                                      borderRadius:
//                                      new BorderRadius.all(new Radius.circular(25.0)),
//                                    ),
//                                  //  padding: EdgeInsets.only(right: 10,),
//                                    child: new Row(
//                                      crossAxisAlignment: CrossAxisAlignment.center,
//                                      children: <Widget>[
//                                        //SizedBox(width: 5.0,),
//                                        new IconButton(
//
//                                          icon: new Icon(Icons.search),
//                                          color: Theme.of(context).accentColor,
//                                          iconSize: Adapt.px(40),
//                                          onPressed: () {},
//                                        ),
//                                        // Icon(Icons.search, size:30,color: Colors.grey,),
//                                        Expanded(
//                                            child: Container(
//                                              alignment: Alignment.center,
//                                              child: TextFormField(
//                                                maxLines: 1,
//                                                key:_key1,
//                                                textAlign: TextAlign.left,
//                                                controller: _searchController,
//                                                //  focusNode: _focusNodeSearch,
//                                                style: TextStyle(
//                                                  fontSize: Adapt.px(30),
//                                                  color: Theme.of(context).accentColor,
//                                                  //fontFamily: 'FontJian'
//                                                ),
//                                                decoration: new InputDecoration(
//                                                  // contentPadding: EdgeInsets.only(top: 1.0),
//                                                  hintText: '请输入...',
//
//                                                  //focusColor: Colors.white,
//                                                  hintStyle: TextStyle(
//                                                    color: Theme.of(context).cardColor,
//                                                  ),
//                                                  border: InputBorder.none,
//                                                  suffixIcon: IconButton(
//                                                      key: _key2,
//                                                      iconSize: 30,
//                                                      color: Theme.of(context).accentColor,
//                                                      icon: Icon((_isShowClear)
//                                                          ? Icons.cancel
//                                                          : Icons.keyboard_voice),
//                                                      onPressed: () {
//                                                        _searchController.clear();
//                                                      }),
//                                                ),
//                                              ),
//                                            )),
////                              new Text(
////                                "|",
////                                style: TextStyle(
////                                    color: Theme.of(context).accentColor,
////                                    fontSize: Adapt.px(30)),
////                              ),
//                                        new Container(
//                                          padding: EdgeInsets.all(8),
//                                          child: RaisedButton(
//                                            color: Theme.of(context).cardColor,
//
//                                            onPressed: (){
//                                              _focusNodeSearch.unfocus();
//                                              print(_searchController);
//                                              searpart = _searchController.text;
//                                              if (searpart != "") {
//
//                                                _listSearch.add(searpart);
//                                                //save();
//                                                //  getStringList(mListSearch);
////                                                Scaffold.of(context).showSnackBar(
////                                                    new SnackBar(content:  Text("数据存储成功")));
//                                                global.setSearchV(searpart);
//                                                print('搜索内容是：${global.getSearchV()}');
//                                                Navigator.push(
//                                                    context,
//                                                    MaterialPageRoute(
//                                                        builder: (context) => httpPage()));
//                                              }; //后期判断搜索内容是否为空
//                                            },
//                                            shape: StadiumBorder(),
//                                            //disabledColor: Theme.of(context).accentColor,
//                                            child: Container(
//                                              padding: EdgeInsets.all(5),
//                                              child: Text(
//                                                "搜索",
//                                                style: TextStyle(
//                                                    color: Theme.of(context).primaryColorLight,
//                                                    fontSize: Adapt.px(30)),
//                                              ),
//                                            ),
//                                          ),
//                                        )
//
////
//                                      ],
//                                    ),
//                                  )),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
//                  ),
                  new Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(Adapt.px(20)),
                    child: Text(
                      '热搜',
                      key: _key3,
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: Adapt.px(35),
                        fontFamily: 'FontJian',
                      ),
                    ),
                  ),
                  new Container(
                    padding: EdgeInsets.only(top: Adapt.px(10),left: Adapt.px(25),right: Adapt.px(25)),
                    child: ChipTheme(
//统一设置Chip组件样式
                      data: ChipThemeData(
                        backgroundColor: Theme.of(context).primaryColor,
                        disabledColor: Theme.of(context).primaryColor,
                        selectedColor: Theme.of(context).primaryColor,
                        secondarySelectedColor: Theme.of(context).primaryColor,
                        labelPadding: EdgeInsets.all(Adapt.px(8)),//框离字的距离
                        padding: EdgeInsets.all(0),
                        shape: StadiumBorder(
                            side: BorderSide(
                              width: 1,//框粗细的大小
                              style: BorderStyle.solid,
                              color: Theme.of(context).dividerColor,
                            )),
                        labelStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                        secondaryLabelStyle: TextStyle(color: Colors.white),
                        brightness: Brightness.dark,
                        //elevation:20,//背景阴影颜色
                        // shadowColor:Colors.lime,
                      ),
                      child: Wrap(
                        spacing: Adapt.px(10.0),//两个框的距离
                       runSpacing: Adapt.px(10.0),//上下两行之间的距离
                        children: <Widget>[
                          // Chip(label: Text('${list_Recommend[]}'),),
                          for (int i = 0; i < list_Recommend.length; i++)
                            GestureDetector(
                              onTap: () {
                                _focusNodeSearch.unfocus();
                                //   print(_searchController);
                                searpart = list_Recommend[i];
                                if (searpart != "") {
                                  _listSearch.add(searpart);
                                  global.setSearchV(searpart);

                                  print('搜索内容是：${global.getSearchV()}');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => httpPage()));
                                }
                                ; //后期判断搜索内容是否为空
                              },
                              child: Chip(
                                label: Text(
                                  // list[i],
                                  list_Recommend[i],
                                  style: TextStyle(
                                    //fontFamily: 'FontShou',
                                      fontSize: Adapt.px(30)),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  new Container(
                    child: (_listSearch.length!=0)?ListTile(
                      title: Text(
                        '搜索历史',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: Adapt.px(35),
                          fontFamily: 'FontJian',
                        ),
                      ),
                      trailing:FlatButton(
                         color:Colors.transparent,
                          onPressed: (){
                            setState(() {
                              _listSearch = [];
                            });
                          },
                          child: Text(
                            '清空',
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: Adapt.px(25),
                              fontFamily: 'FontJian',
                            ),
                          ),
                        ),
                    ):null,

                  ),

                  Column(
                    children: <Widget>[
                      for (int i = _listSearch.length; i > 0; i--)
                        Container(
                          color: Theme.of(context).primaryColor,
                          child:ListTile(
                            onTap: () {
                              _focusNodeSearch.unfocus();
                              //  print(_searchController);
                              searpart = _listSearch[i - 1];
                              if (searpart != "") {
                                _listSearch.add(searpart);
                                global.setSearchV(searpart);

                                print('搜索内容是：${global.getSearchV()}');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => httpPage()));
                              }
                              ; //后期判断搜索内容是否为空
                            },
                            title: Text(
                              // list[i -1],
                              _listSearch[i - 1],
                              maxLines: 1,
                              overflow:TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: Adapt.px(25),
                              ),
                            ),
                            trailing:
                            IconButton(
                              color: Theme.of(context).accentColor,
                              icon: Icon(Icons.clear,size: Adapt.px(25),),
                              onPressed: (){
                                _searchClear('${_listSearch[i-1]}');
                              },
                            ),
                          ) ,

                        )

                    ],
                  )
                ],
              ),
            ),
          ));
    })
    ;
  }

  GlobalKey _key1 = GlobalKey();
  GlobalKey _key2 = GlobalKey();
  GlobalKey _key3 = GlobalKey();
///这里是根据KEY 自动计算位置信息的
//  void show1() {
//    {
//      List<GlobalKeyPoint>  globalKeyPointList =[];
//      globalKeyPointList.add(GlobalKeyPoint(_key1,tipsMessage: "这里输入文字，点击“搜索”诗词"));
//      globalKeyPointList.add(GlobalKeyPoint(_key2,tipsMessage: "这里可以通过语音搜索"));
//      globalKeyPointList.add(GlobalKeyPoint(_key3,tipsMessage: "热门搜索，和大家一起看看吧"));
//      showBeginnerGuidance(context, globalKeyPointList:globalKeyPointList ,logs: true,isSlide: true);
//    }
//  }
}

