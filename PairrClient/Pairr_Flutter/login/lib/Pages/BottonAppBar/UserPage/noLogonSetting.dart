import 'package:flutter/material.dart';
import 'package:login/Pages/Login/loginPage.dart';
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
  double _fontSize = 18;
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
            appBar: AppBar(title: Text('设置'),centerTitle: true,),
            body: Container(
              child: ListView(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 5,color: Color(0xffe5e5e5)),
                          bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                    child:  ListTile(
                      title: Text('简繁切换',style: TextStyle(fontSize: this._fontSize),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                      },
                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                    child:  ListTile(
                      title: Text('孟诗韩笔字体',style: TextStyle(fontSize: this._fontSize),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios),
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
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 8,color: Color(0xffe5e5e5))),),
                    child:  ListTile(
                      title: Text('主题风格',style: TextStyle(fontSize: this._fontSize),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios),
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
                                Provide.value<ConfigProvide>(context).$setTheme('white');  //修改当前主题
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              title: Text('黑白色绅士风'),
                              trailing: Text('应用'),
                              onTap: (){
                                Provide.value<ConfigProvide>(context).$setTheme('black');
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
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                    child:  ListTile(
                      title: Text('清楚缓存',style: TextStyle(fontSize: this._fontSize),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                      },

                    ),
                  ),
                  new Container(
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),),
                    child:  ListTile(
                      title: Text('版本更新',style: TextStyle(fontSize: this._fontSize),),
                      //   leading: Icon(Icons.build),
                      trailing: Icon(Icons.arrow_forward_ios),
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