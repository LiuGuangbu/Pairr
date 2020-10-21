import 'package:flutter/material.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingPage();
  }

}





class _SettingPage extends State<SettingPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
          child:  AppBar(
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios, color: Theme.of(context).accentColor ,size: Adapt.px(35),),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text('设置',style: TextStyle(color: Theme.of(context).accentColor,fontSize: Adapt.px(35)),),
            centerTitle: true,//居中设置
          ),
          preferredSize: Size.fromHeight(Adapt.px(90)),
        ),
      body: new ListView(

        children: <Widget>[
          new Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(1),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(
                '账号与安全',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:Adapt.px(30),
                color: Theme.of(context).accentColor,
              ),
              onTap: () {},
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(1),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(
                '简繁切换',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:Adapt.px(30),
                color: Theme.of(context).accentColor,
              ),
              onTap: () {},
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(1),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(
                '推荐字体',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:Adapt.px(30),
                color: Theme.of(context).accentColor,
              ),
              onTap: () {},
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(18),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(
                '通用字体',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:Adapt.px(30),
                color: Theme.of(context).accentColor,
              ),
              onTap: () {},
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(1),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(
                '推荐给朋友',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:Adapt.px(30),
                color: Theme.of(context).accentColor,
              ),
              onTap: () {},
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(18),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(
                '评价此诗词客',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:Adapt.px(30),
                color: Theme.of(context).accentColor,
              ),
              onTap: () {},
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(1),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(
                '清除缓存',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:Adapt.px(30),
                color: Theme.of(context).accentColor,
              ),
              onTap: () {},
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(1),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(
                '版本更新',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:Adapt.px(30),
                color: Theme.of(context).accentColor,
              ),
              onTap: () {},
            ),
          ),
          new Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(18),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(
                '关于我们',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size:Adapt.px(30),
                color: Theme.of(context).accentColor,
              ),
              onTap: () {},
            ),
          ),
          new Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border(
                  bottom: BorderSide(
                      width: Adapt.px(18),
                      color: Theme.of(context).dialogBackgroundColor)),
            ),
            child: ListTile(
              title: Text(

                '退出登录',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: Adapt.px(28)),
              ),
              //   leading: Icon(Icons.build),
              onTap: () {

                setState(() {
                  global.set_logonstate(false);
                  Navigator.pop(context);
                });
              },
            ),
          ),
        ],
      ),
    )
        ;}}



