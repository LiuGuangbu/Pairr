import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:login/Pages/BottonAppBar/SearchPage/Show_Poem.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';

class httpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return httpGet();
  }
}

class httpGet extends State<httpPage> {
  List _list = [];
  //var poem = const {'poemname': '', 'dynasty': '', 'author': '', 'content': ''};
  //var Poems = [];

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getdata();
  }

  _getdata() async {
    print('开始请求了！！！');
    var apiUrl = global.get_apiUrlserach(); //var apiUrl = "http://192.168.1.9:5050/serach";
    String apiSearch = global.getSearchV(); //搜索的内容

    var response = await http.post(apiUrl, body: {'text_search': apiSearch});
    //var response = await http.post(apiUrl,body:{'label':'今晚的月亮好美啊'});
    if (response.statusCode == 200) {
      /*var ret=convert.jsonDecode(response.body);

      print(ret);*/
      setState(() {
        this._list = convert.jsonDecode(response.body)['text_search'];
        print('得到数据是：${this._list}');
        print(this._list);
        //    global.setlistPoemslength(this._list.length);
        //   global.setlistPoems(this._list);
      });
    } else {
      print('失败: ${response.statusCode}');
    }
    print('请求结束了！！！');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PoemChange(_list);
  }
}

class PoemChange extends StatelessWidget {
  final List _list;
  PoemChange(this._list);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _list.length > 0
        ? ShowPoem(_list)
        : Scaffold(
      appBar: PreferredSize(
        child: AppBar(
//              title:GestureDetector(
//                onTap: () => Navigator.of(context).pop(),
//                child:Text('返回',style: TextStyle(color: Theme.of(context).accentColor),) ,
//              ) ,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back_ios,
              size: Adapt.px(35),
              color: Theme.of(context).accentColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        preferredSize: Size.fromHeight(Adapt.px(90)),
      ),
      body: Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.only(top: Adapt.px(60)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth:Adapt.px(4.0),
              backgroundColor:
              Theme.of(context).dividerColor, // value: 0.2,
              valueColor: new AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColorLight,
              ),
            ),
            Text("加载中...",
                style: TextStyle(
                  fontSize: Adapt.px(25),
                  color: Theme.of(context).accentColor,
                )),
          ],
        ),
      ),
    );
  }
}
