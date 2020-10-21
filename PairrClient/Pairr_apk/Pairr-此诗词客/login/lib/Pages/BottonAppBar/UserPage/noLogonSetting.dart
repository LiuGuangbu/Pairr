import 'package:flutter/material.dart';
import 'package:login/Pages/BottonAppBar/UserPage/loginPage.dart';
import 'package:login/Utils/Adapt.dart';
import 'package:login/Utils/ConfigProvide.dart';
import 'package:login/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

class noLogonSetting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _noLogonSetting();
  }

}
class _noLogonSetting extends State<noLogonSetting>{
  //double _fontSize = 18;
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
            appBar: PreferredSize(
              child:AppBar(
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios, color: Theme.of(context).accentColor ,size: Adapt.px(35),),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text('设置',style: TextStyle(fontSize:Adapt.px(35),color: Theme.of(context).accentColor ,),),centerTitle: true,),

              preferredSize: Size.fromHeight(Adapt.px(90)),
            ),body: Container(
              child: ListView(
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
                              width: Adapt.px(18),
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
                              width: Adapt.px(1),
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
                ],

              ) ,
            )
           ,
          );

  }

}