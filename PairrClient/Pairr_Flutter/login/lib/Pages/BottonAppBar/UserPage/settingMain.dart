import 'package:flutter/material.dart';
import 'package:login/Pages/Login/loginMain02.dart';
import 'package:login/Pages/Login/loginPage.dart';
import 'package:login/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';






class SettingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
      return Scaffold(
      appBar: AppBar(title: Text('设置',),
        centerTitle: true,//居中设置
      ),
      body: new ListView(

        children: <Widget>[
          new Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Opacity(opacity: 0.1,
                child: Container(
                  decoration: new BoxDecoration(color: Colors.grey),
                  height: 10.0,
                ),)

          ),
          ListTile(
            title: Text('账号与安全'),
            //   leading: Icon(Icons.build),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              //跳出提示框
//              showDialog(
//                  context: context,
//                  child: new SimpleDialog(
//                    contentPadding: const EdgeInsets.all(10.0),
//                    title: new Text("我是标题"),
//                    children: <Widget>[new Text("我是内容区域")],
//                  ));
            },
          ),
          new Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Opacity(opacity: 0.1,
                child: Container(
                  decoration: new BoxDecoration(color: Colors.grey),
                  height: 2.0,
                ),)

          ),
          ListTile(
            title: Text('通用'),
            //   leading: Icon(Icons.build),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              //跳出提示框
//              showDialog(
//                  context: context,
//                  child: new SimpleDialog(
//                    contentPadding: const EdgeInsets.all(10.0),
//                    title: new Text("我是标题"),
//                    children: <Widget>[new Text("我是内容区域")],
//                  ));
            },
          ),
          new Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Opacity(opacity: 0.1,
                child: Container(
                  decoration: new BoxDecoration(color: Colors.grey),
                  height: 2.0,
                ),)

          ),

          ListTile(
            title: Text('推荐给朋友'),
            //   leading: Icon(Icons.build),
             trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              model.updateLogonstate(false);

            },
          ),
          new Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Opacity(opacity: 0.1,
                child: Container(
                  decoration: new BoxDecoration(color: Colors.grey),
                  height: 2.0,
                ),)

          ),

          ListTile(
            title: Text('评价此诗词客'),
            //   leading: Icon(Icons.build),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              //跳出提示框
//              showDialog(
//                  context: context,
//                  child: new SimpleDialog(
//                    contentPadding: const EdgeInsets.all(10.0),
//                    title: new Text("我是标题"),
//                    children: <Widget>[new Text("我是内容区域")],
//                  ));
            },
          ),
          new Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Opacity(opacity: 0.1,
                child: Container(
                  decoration: new BoxDecoration(color: Colors.grey),
                  height: 2.0,
                ),)

          ),
          ListTile(
            title: Text('关于我们'),
            //   leading: Icon(Icons.build),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              //跳出提示框
//              showDialog(
//                  context: context,
//                  child: new SimpleDialog(
//                    contentPadding: const EdgeInsets.all(10.0),
//                    title: new Text("我是标题"),
//                    children: <Widget>[new Text("我是内容区域")],
//                  ));
            },
          ),
          new Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Opacity(opacity: 0.1,
                child: Container(
                  decoration: new BoxDecoration(color: Colors.grey),
                  height: 10.0,
                ),)

          ),
//          new FlatButton(
//            child: Container(child: Text('切换账号',style: TextStyle(fontSize: 18),),),
//            onPressed: (){
////             MultiProvider(providers: [
////                  ChangeNotifierProvider(
////                    builder:  (_)=>LoginProvider(),
////
////                  )
////                ],child: LoginMain());
//
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => Login()));
//
//            },
//          ),
//
//          new Container(
//              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
//              child: Opacity(opacity: 0.1,
//                child: Container(
//                  decoration: new BoxDecoration(color: Colors.grey),
//                  height: 10.0,
//                ),)
//
//          ),
          new FlatButton(
            child: Container(child: Text('退出登录',style: TextStyle(fontSize: 18),),),
            onPressed: (){
              model.updateLogonstate(false);
              Navigator.pop(context);
          //    跳出提示框
//              showDialog(
//                  context: context,
//                  child: new SimpleDialog(
//                    contentPadding: const EdgeInsets.all(10.0),
//                    title: new Text("我是标题"),
//                    children: <Widget>[new Text("我是内容区域")],
//                  ));

            },
          ),

          new Container(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Opacity(opacity: 0.1,
                child: Container(
                  decoration: new BoxDecoration(color: Colors.grey),
                  height: 10.0,
                ),)

          ),
        ],
      ),
    )
        ;},);}}



