import 'package:flutter/material.dart';
import 'package:login/Pages/Login/loginPage.dart';
import 'package:login/scoped_models/Adapt.dart';
import 'package:login/scoped_models/ConfigProvide.dart';
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
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model){
          return Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back_ios, color: Theme.of(context).accentColor ,),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text('设置',style: TextStyle(color: Theme.of(context).accentColor ,),),centerTitle: true,),
            body: Container(
              child: ListView(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(1),color: Theme.of(context).dividerColor)),),

                    child:  ListTile(
                      title: Text('简繁切换',style: TextStyle(color:Theme.of(context).accentColor,fontSize: Adapt.px(18)),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios,color: Theme.of(context).accentColor,),
                      onTap: () {
                      },
                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(1),color: Theme.of(context).dividerColor)),),
                    child:  ListTile(
                      title: Text('推荐字体',style: TextStyle(color:Theme.of(context).accentColor,fontSize: Adapt.px(18)),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios,color: Theme.of(context).accentColor,),
                      onTap: () {
                        if(model.logonstate ==false) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoginPage()));
                        }
                        else{

                        }
                      },
                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(8),color: Theme.of(context).dividerColor)),),
                    child:  ListTile(
                      title: Text('主题风格',style: TextStyle(color:Theme.of(context).accentColor,fontSize: Adapt.px(18)),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios,color: Theme.of(context).accentColor,),
                      onTap: () {
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
                              title: Text('白色简洁风'),
                              trailing: Text('应用'),
                              onTap: (){
                                Provide.value<ConfigProvide>(context).$setTheme('white');
                                global.setThemeV('white');//修改当前主题
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              title: Text('黑白色绅士风'),
                              trailing: Text('应用'),
                              onTap: (){
                                Provide.value<ConfigProvide>(context).$setTheme('black');
                                global.setThemeV('black');//修改当前主题
                                Navigator.of(context).pop();//修改当前主题
                              },
                            )
                          ],
                        ),
                        );
                        });
                      },
                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(1),color: Theme.of(context).dividerColor)),),
                    child:  ListTile(
                      title: Text('清楚缓存',style: TextStyle(color:Theme.of(context).accentColor,fontSize:Adapt.px(18)),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios,color: Theme.of(context).accentColor,),
                      onTap: () {
                      },

                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: Adapt.px(1),color: Theme.of(context).dividerColor)),),
                    child:  ListTile(
                      title: Text('版本更新',style: TextStyle(color:Theme.of(context).accentColor,fontSize: Adapt.px(18)),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios,color: Theme.of(context).accentColor,),
                      onTap: () {
                      },

                    ),
                  ),
                ],

              ) ,
            )
           ,
          );
        });
  }

}