import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class httpPage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return httpGet();
  }
}
class httpGet extends State<httpPage>{
  List _list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getdata();
  }
  _getdata() async{
    print('开始请求了！！！');
    //var apiUrl="http://127.0.0.1:54946/serach";
    var apiUrl="http://192.168.191.1:5000/serach";
    var response = await http.post(apiUrl,body:{'label':'今晚的月亮好美啊'});
    if(response.statusCode==200){
      print(convert.jsonDecode(response.body));
      setState((){
        this._list=convert.jsonDecode(response.body);
        print('得到数据是：${this._list}');
      });
    } else {
      print('失败: ${response.statusCode}');
    }
    print('请求结束了！！！');
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios, color: Theme.of(context).accentColor ,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('搜索结果',style: TextStyle( color: Theme.of(context).accentColor ,),),centerTitle: true,),
        body:this._list.length>0?ListView(
          children: this._list.map((value){

            return ListTile(
              title: Text(value['poemname']),
              subtitle: Text(value['content']),
            );
          }).toList(),
        ):Text("加载中...")
    );
  }
}